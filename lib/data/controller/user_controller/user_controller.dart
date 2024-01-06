import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:khatri_alter/data/model/user_model/user_model.dart';
import 'package:khatri_alter/data/service/user_service/user_service.dart';

class RegistrationController extends GetxController {
  final RegistrationService service = RegistrationService();

   String? name;
   String? email;
   String? password;
   String? userType;

  void setName(String? value) {
    name = value!;
  }

  void setEmail(String? value) {
    email = value!;
  }

  void setPassword(String? value) {
    password = value!;
  }

  void setUserType(String? value) {
    userType = value!;
  }

  Future<void> registerUser() async {
    try {
      UserModel user = UserModel(
          name: name,
          email: email,
          password: password,
          userType: userType,
          uid: '');

      // Register user in Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      // Update the user object with the UID
      user.uid = userCredential.user?.uid ?? '';

      // Store additional user data in Cloud Firestore
      await service.registerUser(user);

      Get.snackbar('Success', 'User registered successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to register user: $e');
    }
  }
}
