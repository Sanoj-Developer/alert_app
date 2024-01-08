import 'package:get/get.dart';
import 'package:khatri_alter/data/model/login_model/login_model.dart';
import 'package:khatri_alter/data/service/login_service/login_service.dart';


class LoginController extends GetxController {
  final LoginService _authService = LoginService();
  final RxBool isLoading = false.obs;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      final user = await _authService.signInWithEmailAndPassword(email, password);
      isLoading.value = false;

      if (user != null) {
        // Do something with the user, e.g., store in a global state using GetX
        Get.put(LoginModel(uid: user.uid, email: user.email!));
        // Navigate to another screen or perform other actions
        Get.toNamed('/home');
      } else {
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      print("Error in signInWithEmailAndPassword: $e");
      isLoading.value = false;
    }
  }
}
