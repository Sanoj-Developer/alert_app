import 'package:flutter/material.dart';
import 'package:khatri_alter/data/utils/text_style.dart';
import 'package:sizer/sizer.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.controller,
    this.hintText,
  });

  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.5.h,
      child: TextFormField(
        //   keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: AppTextStyle.Montserrat, hintText: hintText,
          filled: true,
          //  fillColor: const Color.fromARGB(108, 158, 158, 158),
          fillColor: const Color.fromARGB(137, 255, 255, 255),

          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(1.8.h)),
        ),
      ),
    );
  }
}
