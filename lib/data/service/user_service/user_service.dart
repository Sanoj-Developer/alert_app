import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khatri_alter/data/model/user_model/user_model.dart';


class RegistrationService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('student');

  Future<void> registerUser(UserModel user, String s) async {
    await _userCollection.add({
      'name': user.name,
      'email': user.email,
      'userType': user.userType,
    });
  }
  Future<void> signUpUser(UserModel user, String uid) async {
  await _userCollection.doc(uid).set({
    'name': user.name,
    'email': user.email,
    'userType': user.userType,
  });
}
}