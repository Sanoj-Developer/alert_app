import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khatri_alter/data/model/user_model/user_model.dart';

class RegistrationService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('student');

  Future<void> registerUser(UserModel user) async {
    await _userCollection.doc(user.uid).set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'userType': user.userType,
    });
  }
}
