import 'package:flutter/material.dart';
import 'package:khatri_alter/data/utils/text_style.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String btnLabel;
  final Function()? ontap;
  const CustomButton({
    super.key,
    required this.btnLabel,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 6.5.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(1.8.h)),
        child: Center(
          child: Text(
            btnLabel,
            style: AppTextStyle.varelaRegular,
          ),
        ),
      ),
    );
  }
}
