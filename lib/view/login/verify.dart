import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khatri_alter/view/registration_form/registration_form_view.dart';
import 'package:sizer/sizer.dart';

class VerifyScreen extends StatefulWidget {
  final verficationCode;
  const VerifyScreen({super.key, this.verficationCode});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final otpController = TextEditingController();
   final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                decoration: const InputDecoration(hintText: "Enter OTP")),
                SizedBox(height: 2.5.h,),
                TextButton(onPressed: ()async{
                  final credential =PhoneAuthProvider.credential(verificationId: widget.verficationCode, smsCode: otpController.text.toString());
                  try{
                    await  auth.signInWithCredential(credential);
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>RegistrationFormView()));
                  }catch(e){}
                }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
