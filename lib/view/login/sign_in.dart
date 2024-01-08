// login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatri_alter/data/controller/login_controller/login_controller.dart';
import 'package:khatri_alter/view/test_login/test_sign_up.dart';

class SignInView extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 16),
              Obx(() {
                return ElevatedButton(
                  onPressed: _controller.isLoading.value
                      ? null
                      : () {
                          // Trigger login logic when the button is pressed
                          _controller.signInWithEmailAndPassword(
                            emailController.text
                                .trim(), // Replace with actual email
                            passwordController.text
                                .trim(), // Replace with actual password
                          );
                        },
                  child: _controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                );
              }),
              TextButton(
                  onPressed: () {
                    Get.to(() => RegistrationView());
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
