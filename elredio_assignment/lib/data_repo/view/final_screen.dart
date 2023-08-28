import 'dart:developer';

import 'package:elredio_assignment/constants/colors.dart';
import 'package:elredio_assignment/constants/strings.dart';
import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:elredio_assignment/data_repo/view/custom_button.dart';
import 'package:elredio_assignment/data_repo/view/main_page.dart';
import 'package:elredio_assignment/data_repo/view_model/screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  ///
  final Widget space = const SizedBox(
    height: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    final screenViewModel =
        Provider.of<ScreenViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.textfieldTextColor,
      body: Column(
        children: [
          ///HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: MediaQuery.of(context).size.height * 0.325,
            decoration: BoxDecoration(
              color: AppColors.textfieldTextColor,
            ),
            child: Column(
              children: [
                ///
                SizedBox(
                  height: MediaQuery.of(context).padding.top +
                      MediaQuery.of(context).size.height * 0.04,
                ),

                ///
                Row(
                  children: [
                    ///
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.headerColor,
                      ),
                    ),

                    ///
                    Text(
                      AppStrings.profileSummary,
                      style: AppTextStyle.gamificationTextStyle,
                    ),
                  ],
                ),

                ///
                space,

                ///
                RichText(
                  text: TextSpan(
                    text: "${AppStrings.hi}, ",
                    style: AppTextStyle.headingTextStyle,
                    children: [
                      TextSpan(
                        text: screenViewModel.name,
                        style: AppTextStyle.headingYellowTextStyle,
                      )
                    ],
                  ),
                ),

                ///
                space,

                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///
                    Text(
                      AppStrings.youDidIt,
                      style: AppTextStyle.headingWhiteTextStyle,
                    ),

                    ///
                    const SizedBox(
                      width: 10.0,
                    ),

                    ///
                    Icon(
                      Icons.celebration,
                      color: AppColors.headerColor,
                      size: 30.0,
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///BODY
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20.0,
                  ),
                  topRight: Radius.circular(
                    20.0,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  space,

                  ///
                  Text(
                    AppStrings.reviewYourChanges,
                    style: AppTextStyle.textfieldTextStyle,
                  ),

                  space,

                  ///
                  Text(
                    AppStrings.myPersonalDetails,
                    style: AppTextStyle.questionTextStyle,
                  ),

                  space,

                  ...List.generate(
                    screenViewModel.screenList.length - 1,
                    (index) => RichText(
                      text: TextSpan(
                        text: "${screenViewModel.screenList[index].question} ",
                        style: AppTextStyle.textfieldTextStyle,
                        children: [
                          TextSpan(
                            text: screenViewModel.screenList[index].ans,
                            style: AppTextStyle.underLineTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),

                  ///
                  space,

                  ///
                  Text(
                    AppStrings.howIKeepBusy,
                    style: AppTextStyle.questionTextStyle,
                  ),

                  space,

                  ///
                  RichText(
                    text: TextSpan(
                      text: "${screenViewModel.screenList.last.question} ",
                      style: AppTextStyle.textfieldTextStyle,
                      children: [
                        TextSpan(
                          text: screenViewModel.screenList.last.ans,
                          style: AppTextStyle.underLineTextStyle,
                        )
                      ],
                    ),
                  ),

                  ///
                  RichText(
                    text: TextSpan(
                      text: "${screenViewModel.lastQuestion} ",
                      style: AppTextStyle.textfieldTextStyle,
                      children: [
                        TextSpan(
                          text: screenViewModel.technology,
                          style: AppTextStyle.underLineTextStyle,
                        )
                      ],
                    ),
                  ),

                  ///
                  space,

                  ///
                  const Spacer(),

                  ///
                  Row(
                    children: [
                      ///
                      CustomeButtonIcon(
                        iconData: Icons.restore,
                        onTap: () {
                          ///
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),

                      ///
                      const SizedBox(
                        width: 20.0,
                      ),

                      ///
                      Expanded(
                        child: CustomeButton(
                          buttonName: AppStrings.confirm,
                          onTap: () {
                            screenViewModel.postUserInformation().then(
                              (value) {
                                log("Value $value");
                                if (value == true) {
                                  showDialogUtil(
                                    context: context,
                                    isSuccess: true,
                                  );
                                } else {
                                  showDialogUtil(
                                    context: context,
                                    isSuccess: false,
                                  );
                                }
                              },
                            );
                          },
                          dontKeepMinSize: true,
                        ),
                      ),
                    ],
                  ),

                  ///
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  showDialogUtil({required bool isSuccess, required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Icon(
            isSuccess ? Icons.check_circle : Icons.warning,
            color: isSuccess ? AppColors.green : AppColors.red,
            size: 50.0,
          ),
          content: Text(
            isSuccess ? AppStrings.success : AppStrings.failure,
            textAlign: TextAlign.center,
            style: AppTextStyle.headingBlackTextStyle,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                ///
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.enabledButtonColor,
              ),
              child: Text(
                AppStrings.ok,
                style: AppTextStyle.buttonTextStyle,
              ),
            )
          ],
        );
      },
    );
  }
}
