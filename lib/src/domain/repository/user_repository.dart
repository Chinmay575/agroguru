import 'package:agroguru/src/data/models/user.dart';
import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/utils/constants/strings/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static Future onUserCreated(UserAccount acc) async {
    try {
      DocumentReference ref = db.collection(Collections.users).doc(acc.id);

      DocumentSnapshot snapshot = await ref.get();

      if (!snapshot.exists) {
        await ref.set(acc.toMap());
      }
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<UserAccount> getUserData(String id) async {
    DocumentReference ref = db.collection(Collections.users).doc(id);

    DocumentSnapshot snapshot = await ref.get();

    if (snapshot.exists) {
      print('Snapshot exists');
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      // print(data);
      return UserAccount.fromMap(data);
    } else {
      print('Snapshot does not exists');
      UserAccount acc = UserAccount.fromUser(AuthRepository.auth.currentUser!);

      await ref.set(acc.toMap());
      return acc;
    }
  }

  static Future<bool> updateUserData({required UserAccount acc}) async {
    try {
      DocumentReference ref = db.collection(Collections.users).doc(acc.id);
      DocumentSnapshot snapshot = await ref.get();

      acc.lastUpdated = DateTime.now().toString();

      if (snapshot.exists) {
        await ref.update(acc.toMap());
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
