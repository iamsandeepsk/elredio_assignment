import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:elredio_assignment/data_repo/model/screen_model.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({Key? key, required this.options}) : super(key: key);
  final List<Options> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        options.length,
        (index) => RadioListTile(
          value: options[index].value ?? "",
          groupValue: options[index].value,
          onChanged: (value) {},
          title: Text(
            options[index].text ?? "",
            style: AppTextStyle.textfieldTextStyle,
          ),
        ),
      ),
    );
  }
}
