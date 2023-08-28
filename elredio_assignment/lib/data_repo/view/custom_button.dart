import 'package:elredio_assignment/constants/colors.dart';
import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({Key? key, required this.buttonName, required this.onTap})
      : super(key: key);
  final String buttonName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.075,
          ),
          primary: AppColors.enabledButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
      child: Text(
        buttonName,
        style: AppTextStyle.buttonTextStyle,
      ),
    );
  }
}
