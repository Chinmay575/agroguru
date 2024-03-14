import 'package:agroguru/src/data/models/user.dart';
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
}
