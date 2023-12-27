import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:khatri_alter/data/utils/routes/routes.dart';
import 'package:khatri_alter/data/utils/colors.dart';
import 'package:khatri_alter/data/utils/images.dart';
import 'package:khatri_alter/data/utils/text_style.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => Get.toNamed(Routes.login));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.bgColors,
            body: LayoutBuilder(builder: (context, constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageResources.logo,
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "WELCOME",
                      style: AppTextStyle.rowdiesBold,
                    )
                  ],
                ),
              );
            })));
  }
}
