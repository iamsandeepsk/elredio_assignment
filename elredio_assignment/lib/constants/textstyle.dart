import 'package:elredio_assignment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  ///
  static TextStyle questionTextStyle = GoogleFonts.poppins(
    fontSize: 28.0,
    color: AppColors.questionColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle gamificationTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.headerColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle headingTextStyle = GoogleFonts.poppins(
    fontSize: 20.0,
    color: AppColors.headerColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle headingYellowTextStyle = GoogleFonts.poppins(
    fontSize: 20.0,
    color: AppColors.questionColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle headingWhiteTextStyle = GoogleFonts.poppins(
    fontSize: 30.0,
    color: AppColors.headerColor,
    fontWeight: FontWeight.w500,
  );
  ///
  static TextStyle headingBlackTextStyle = GoogleFonts.poppins(
    fontSize: 30.0,
    color: AppColors.textfieldTextColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle buttonTextStyle = GoogleFonts.poppins(
    fontSize: 20.0,
    color: AppColors.textfieldTextColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle hintTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.hintTextColor,
    fontWeight: FontWeight.w400,
  );

  ///
  static TextStyle textfieldTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.textfieldTextColor,
    fontWeight: FontWeight.w400,
  );
  ///
  static TextStyle underLineTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.textfieldTextColor,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline
  );
}
