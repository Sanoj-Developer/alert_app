import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:khatri_alter/data/utils/images.dart';
import 'package:khatri_alter/data/utils/colors.dart';
import 'package:khatri_alter/data/utils/text_style.dart';
import 'package:khatri_alter/data/utils/widgets/custom_button.dart';
import 'package:khatri_alter/data/utils/widgets/custom_text_filed.dart';
import 'package:khatri_alter/view/login/fb_auth.dart';
import 'package:khatri_alter/view/login/verify.dart';
import 'package:khatri_alter/view/registration_form/registration_form_view.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    final auth = FirebaseAuth.instance;
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColors,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFiled(
                controller: mobileController,
                hintText: "Mobile",
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextFiled(
                controller: passwordController,
                hintText: "Password",
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style:
                          AppTextStyle.varelaRegular.copyWith(fontSize: 12.sp),
                    )),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              CustomButton(
                btnLabel: 'Login',
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                      phoneNumber: mobileController.text,
                      verificationCompleted: (_) {
                        setState(() {
                          loading = false;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });
                        Text(e.toString(),
                            style: const TextStyle(color: Colors.red));
                      },
                      codeSent: (String verficatioinCode, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => VerifyScreen(
                                      verficationCode: verficatioinCode,
                                    ))));
                        setState(() {
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Text(
                          e.toString(),
                          style: const TextStyle(color: Colors.red),
                        );
                        setState(() {
                          loading = false;
                        });
                      });
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              TextButton(
                  onPressed: () {
                    //  Get.to(() =>  SignUpView());
                  },
                  child: Text(
                    "Don't have account? SignUp here",
                    style: AppTextStyle.varelaRegular.copyWith(fontSize: 10.sp),
                  )),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      signInGoogle();
                    },
                    child: Image.asset(
                      ImageResources.googleIcn,
                      height: 5.h,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      signInWithFacebook();
                    },
                    child: Image.asset(
                      ImageResources.fbIcn,
                      height: 5.h,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      ImageResources.gitIcn,
                      height: 5.h,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  signInGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        print(userCredential.user?.displayName);
        Get.to(() => const RegistrationFormView());
      }
    } catch (e) {
      print('Error in Google Sign: $e');
    }
  }

  // Future<void> signInWithFacebook() async {
  //   try {
  //     // Trigger Facebook login
  //     final LoginResult result = await FacebookAuth.instance.login();

  //     // Check if the login was successful
  //     if (result.status == LoginStatus.success) {
  //       // Get the access token and use it to sign in with Firebase
  //       final AccessToken accessToken = result.accessToken!;
  //       AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);

  //       // Sign in with Firebase
  //       UserCredential userCredential =
  //           await FirebaseAuth.instance.signInWithCredential(credential);

  //       // Check if the user signed in successfully
  //       if (userCredential.user != null) {
  //         print(userCredential.user?.displayName);

  //         // Navigate to another screen or perform other actions upon successful login
  //       }
  //     } else {
  //       print('Facebook login failed. Status: ${result.status}');
  //     }
  //   } catch (error) {
  //     print('Error signing in with Facebook: $error');
  //   }
  // }
}
