import 'package:elredio_assignment/constants/colors.dart';
import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.isEnabled =true,
  }) : super(key: key);
  final bool? isEnabled;
  final TextEditingController textEditingController;
  final String hintText;

  ///
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(
      color: AppColors.hintTextColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: AppTextStyle.textfieldTextStyle,
      enabled: isEnabled,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.hintTextStyle,
        fillColor: AppColors.textfieldBackColor,
        enabledBorder: border,
        focusedBorder: border,
        border: border,
      ),
    );
  }
}
