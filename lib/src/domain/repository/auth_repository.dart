import 'package:agroguru/src/data/models/user.dart';
import 'package:agroguru/src/domain/repository/user_repository.dart';
import 'package:agroguru/src/utils/constants/enums/login_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static UserAccount? curUser;

  static bool isAuthenticated = false;

  static Future<bool> loginUsingGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    User? user;

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      } catch (e) {
        print(e);
      }
    }

    if (user != null) {
      curUser = await UserRepository.getUserData(user.uid) ??
          UserAccount.fromUser(user);

      UserRepository.onUserCreated(curUser!);
      return true;
    }

    return false;
  }

  static Future<bool> loginUsingEmail({
    required String email,
    required String password,
  }) async {
    UserCredential creds = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = creds.user;
    if (user != null) {
      curUser = await UserRepository.getUserData(user.uid) ??
          UserAccount.fromUser(user);
      UserRepository.onUserCreated(curUser!);
      return true;
    }
    return false;
  }

  static Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await loginUsingEmail(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return false;
  }

  static Future requestForgotPassword({
    required String email,
  }) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  static Future confirmForgotPassword({
    required String password,
    required String otp,
  }) async {
    await auth.confirmPasswordReset(
      code: otp,
      newPassword: password,
    );
  }

  static Future<bool> verifyEmail({
    required String otp,
  }) async {
    try {
      if (auth.currentUser != null) {
        await auth.applyActionCode(otp);
        return true;
      }
      return false;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> requestEmailVerification() async {
    try {
      if (auth.currentUser != null) {
        await auth.currentUser!.sendEmailVerification();
        return true;
      }
      return false;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future checkAuthStatus() async {
    auth.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          isAuthenticated = true;
          curUser = UserAccount.fromUser(user);
          // print(user.email);
        }
      },
    );
  }

  static Future logOut() async {
    curUser = null;
    isAuthenticated = false;
    await auth.signOut();
  }

  static LoginType? getAuthProvider() {
    try {
      print(auth.currentUser?.providerData[0]);
      String? data =
          auth.currentUser?.providerData[0].providerId.split('.').first;
      if (data?.isNotEmpty ?? false) {
        LoginType? type =
            LoginType.values.firstWhere((element) => element.name == data);
        return type;
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
