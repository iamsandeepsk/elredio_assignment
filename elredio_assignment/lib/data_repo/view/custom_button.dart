import 'package:elredio_assignment/constants/colors.dart';
import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {Key? key,
      required this.buttonName,
      required this.onTap,
      this.dontKeepMinSize = false})
      : super(key: key);
  final String buttonName;
  final bool? dontKeepMinSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: dontKeepMinSize == true
            ? Size(
                MediaQuery.of(context).size.height * 0.075,
                MediaQuery.of(context).size.height * 0.075,
              )
            : Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.075,
              ),
        primary: AppColors.enabledButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        buttonName,
        style: AppTextStyle.buttonTextStyle,
      ),
    );
  }
}

class CustomeButtonIcon extends StatelessWidget {
  const CustomeButtonIcon(
      {Key? key, required this.iconData, required this.onTap})
      : super(key: key);
  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: AppColors.enabledButtonColor,
          child: Container(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Icon(
                iconData,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
