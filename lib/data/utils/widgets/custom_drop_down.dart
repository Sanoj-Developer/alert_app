import 'package:flutter/material.dart';
import 'package:khatri_alter/data/utils/text_style.dart';
import 'package:sizer/sizer.dart';

class CustomDropdownWidget extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdownWidget({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(137, 255, 255, 255),
        borderRadius: BorderRadius.circular(1.8.h),
      ),
      child: DropdownButton<String>(
        padding: EdgeInsets.only(left: 2.w, right: 2.w),
        style: AppTextStyle.Montserrat.copyWith(
          fontWeight: FontWeight.bold,
        ),
        isExpanded: true,
        underline: const SizedBox(),
        value: widget.selectedValue,
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
