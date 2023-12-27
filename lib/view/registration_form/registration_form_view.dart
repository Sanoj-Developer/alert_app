import 'package:flutter/material.dart';
import 'package:khatri_alter/data/utils/colors.dart';
import 'package:khatri_alter/data/utils/text_style.dart';
import 'package:khatri_alter/data/utils/widgets/custom_drop_down.dart';
import 'package:khatri_alter/data/utils/widgets/custom_text_filed.dart';
import 'package:sizer/sizer.dart';

class RegistrationFormView extends StatefulWidget {
  const RegistrationFormView({super.key});

  @override
  State<RegistrationFormView> createState() => _RegistrationFormViewState();
}

class _RegistrationFormViewState extends State<RegistrationFormView> {
  String selectedNauk = 'Select Nukh';
  String cityFrom = 'City From';
  String currentCity = 'City Current';
  String noOfChild = 'No. of Children';

  List<String> nukhList = [
    'Select Nukh',
    'Keri',
    'Chuncha',
    'Bhoote',
    'Warde',
    'Grach'
  ];
  List<String> cityList = [
    'City From',
    'MirpurKhas',
    'Umerkot',
    'Dhoronaro',
    'Pithoro',
    'Khipro',
    'Mithi'
  ];

  List<String> currentCityList = [
    'City Current',
    'MirpurKhas',
    'Umerkot',
    'Dhoronaro',
    'Pithoro',
    'Khipro',
    'Mithi'
  ];
  List<String> nochildrenList = [
    'No. of Children',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];
  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.bgColors,
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 3.h, left: 3.w, right: 3.w),
              child: Column(
                children: [
                  Text(
                    "Registration",
                    style: AppTextStyle.varelaRegular.copyWith(fontSize: 30.sp),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7.h,
                          ),
                          CustomTextFiled(
                            controller: cityController,
                            hintText: "Name",
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFiled(
                            controller: cityController,
                            hintText: "Father's Name",
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFiled(
                            controller: cityController,
                            hintText: "Occupation",
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomDropdownWidget(
                              items: nukhList,
                              selectedValue: selectedNauk,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedNauk = newValue!;
                                });
                              }),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomDropdownWidget(
                              items: nochildrenList,
                              selectedValue: noOfChild,
                              onChanged: (String? newValue) {
                                setState(() {
                                  noOfChild = newValue!;
                                });
                              }),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: CustomDropdownWidget(
                                    items: cityList,
                                    selectedValue: cityFrom,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        cityFrom = newValue!;
                                      });
                                    }),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Flexible(
                                child: CustomDropdownWidget(
                                    items: currentCityList,
                                    selectedValue: currentCity,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        currentCity = newValue!;
                                      });
                                    }),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
