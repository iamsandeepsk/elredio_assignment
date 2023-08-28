import 'dart:developer';

import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:elredio_assignment/data_repo/model/screen_model.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.options,
    required this.ans,
    required this.onTap,
  }) : super(key: key);
  final List<Options> options;
  final String ans;
  final Function(String?) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        options.length,
        (index) => RadioListTile(
          value: options[index].value ?? "",
          groupValue: ans,
          onChanged: (String? value) {
            log("Value Radio $value | $ans");
            onTap(value);
          },
          title: Text(
            options[index].text ?? "",
            style: AppTextStyle.textfieldTextStyle,
          ),
        ),
      ),
    );
  }
}
