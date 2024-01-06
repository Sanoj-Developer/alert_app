import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:khatri_alter/data/utils/routes/routes.dart';
import 'package:khatri_alter/data/utils/colors.dart';
import 'package:khatri_alter/data/utils/widgets/custom_button.dart';
import 'package:khatri_alter/data/utils/widgets/custom_text_filed.dart';
import 'package:sizer/sizer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final mobileController = TextEditingController();
    final passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColors,
        body: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFiled(
                controller: nameController,
                hintText: "Name",
              ),
              SizedBox(
                height: 2.h,
              ),
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
              SizedBox(
                height: 2.5.h,
              ),
              CustomButton(
                btnLabel: 'SignUp',
                ontap: () => Get.toNamed(Routes.registrationForm),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SignUpView extends StatefulWidget {
//   @override
//   _SignUpViewState createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> {
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _smsCodeController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String _verificationId = "";

//   // Function to initiate phone number verification
//   Future<void> _verifyPhoneNumber() async {
//     try {
//       await _auth.verifyPhoneNumber(
//         phoneNumber: '+${_phoneNumberController.text.trim()}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           // Auto-retrieval of verification code has succeeded.
//           // Sign in using the received credential.
//           await _auth.signInWithCredential(credential);
//           print("Verification Completed");
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           // Handle the verification failed error
//           print("Verification Failed: ${e.message}");
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           // Save the verification ID and show the OTP input screen
//           _verificationId = verificationId;
//           print("Code Sent: $verificationId");
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           // Auto-retrieval timed out, handle it here
//           print("Code Auto Retrieval Timeout: $verificationId");
//         },
//       );
//     } catch (e) {
//       // Handle other errors
//       print("Error: $e");
//     }
//   }

//   // Function to sign in using the entered verification code
//   Future<void> _signInWithPhoneNumber() async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId,
//         smsCode: _smsCodeController.text.trim(),
//       );
//       await _auth.signInWithCredential(credential);
//       print("User Signed In");
//     } catch (e) {
//       // Handle the sign-in error
//       print("Sign In Error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Authentication'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _phoneNumberController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(labelText: 'Enter Phone Number'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _verifyPhoneNumber,
//               child: Text('Send Verification Code'),
//             ),
//             SizedBox(height: 32.0),
//             TextField(
//               controller: _smsCodeController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter Verification Code'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _signInWithPhoneNumber,
//               child: Text('Verify'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }