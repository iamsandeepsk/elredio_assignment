import 'dart:developer';

import 'package:elredio_assignment/constants/colors.dart';
import 'package:elredio_assignment/constants/strings.dart';
import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:elredio_assignment/data_repo/model/screen_model.dart';
import 'package:elredio_assignment/data_repo/view/final_screen.dart';
import 'package:elredio_assignment/data_repo/view/parse_widget.dart';
import 'package:elredio_assignment/data_repo/view_model/screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ///
  late ScreenViewModel screenViewModel;

  ///
  @override
  void initState() {
    super.initState();

    ///
    screenViewModel = Provider.of<ScreenViewModel>(context, listen: false);

    ///
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///
      screenViewModel.resetData();

      /// PARSE JSON
      screenViewModel.getListOfScreens(json: AppStrings.json).then((value) {
        ///
        nextPage();
      });
    });
  }

  ///
  nextPage() {
    ///
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Consumer<ScreenViewModel>(
            builder: (context, value, child) {
              return ParseWidget(
                answer: screenViewModel
                            .screenList[screenViewModel.currentIndex].ans ==
                        "null"
                    ? ""
                    : screenViewModel
                            .screenList[screenViewModel.currentIndex].ans ??
                        "",
                onBackPress: () {
                  ///
                  screenViewModel.decrementIndex();
                  log("2 Decrement Index ${screenViewModel.currentIndex}");
                },
                totalProgress: screenViewModel.screenList.length + 1,
                currentProgressIndex: screenViewModel.currentIndex,
                showBackButton: screenViewModel.currentIndex != 0,
                screenName: screenViewModel
                    .screenList[screenViewModel.currentIndex].screenName,
                heading: screenViewModel
                    .screenList[screenViewModel.currentIndex].heading,
                question: screenViewModel
                    .screenList[screenViewModel.currentIndex].question,
                fieldType: screenViewModel
                    .screenList[screenViewModel.currentIndex].fields,
                hintText: screenViewModel
                    .screenList[screenViewModel.currentIndex].hintText,
                options: screenViewModel
                    .screenList[screenViewModel.currentIndex].options,
                onTap: (String answer) {
                  ///
                  screenViewModel.screenList[screenViewModel.currentIndex].ans =
                      answer;

                  ///
                  if (screenViewModel.incrementIndex()) {
                    log("2 Increment Index ${screenViewModel.currentIndex}");

                    ///
                    nextPage();
                  } else if (screenViewModel
                          .screenList[screenViewModel.currentIndex]
                          .childScreen !=
                      null) {
                    /// NAVIGATE TO CHILD AS PER LAST ANSWER

                    if (screenViewModel
                            .screenList[screenViewModel.currentIndex].ans
                            ?.contains("frontend") ??
                        false) {
                      ///
                      if (screenViewModel
                              .screenList[screenViewModel.currentIndex]
                              .childScreen
                              ?.frontend
                              ?.isNotEmpty ??
                          false) {
                        ///
                        childPageCall(
                          screen: screenViewModel
                              .screenList[screenViewModel.currentIndex]
                              .childScreen!
                              .frontend!
                              .first,
                          screenType: screenViewModel
                                  .screenList[screenViewModel.currentIndex]
                                  .ans ??
                              "",
                        );
                      }
                    } else if (screenViewModel
                            .screenList[screenViewModel.currentIndex].ans
                            ?.contains("backend") ??
                        false) {
                      ///
                      if (screenViewModel
                              .screenList[screenViewModel.currentIndex]
                              .childScreen
                              ?.backend
                              ?.isNotEmpty ??
                          false) {
                        ///
                        childPageCall(
                          screen: screenViewModel
                              .screenList[screenViewModel.currentIndex]
                              .childScreen!
                              .backend!
                              .first,
                          screenType: screenViewModel
                                  .screenList[screenViewModel.currentIndex]
                                  .ans ??
                              "",
                        );
                      }
                    } else if (screenViewModel
                            .screenList[screenViewModel.currentIndex].ans
                            ?.contains("design") ??
                        false) {
                      ///
                      if (screenViewModel
                              .screenList[screenViewModel.currentIndex]
                              .childScreen
                              ?.designer
                              ?.isNotEmpty ??
                          false) {
                        ///
                        childPageCall(
                          screen: screenViewModel
                              .screenList[screenViewModel.currentIndex]
                              .childScreen!
                              .designer!
                              .first,
                          screenType: screenViewModel
                                  .screenList[screenViewModel.currentIndex]
                                  .ans ??
                              "",
                        );
                      }
                    }
                  }
                },
              );
            },
          );
        },
      ),
    );
  }

  ///
  childPageCall({
    required Screens screen,
    required String screenType,
  }) {
    ///
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Consumer<ScreenViewModel>(builder: (context, value, child) {
            return ParseWidget(
              answer: screen.ans == "null" ? "" : screen.ans ?? "",
              onBackPress: () {},
              totalProgress: screenViewModel.screenList.length + 1,
              currentProgressIndex: screenViewModel.currentIndex + 1,
              showBackButton: screenViewModel.currentIndex != 0,
              screenName: screen.screenName,
              heading: screen.heading,
              question: screen.question,
              fieldType: screen.fields,
              hintText: screen.hintText,
              options: screen.options,
              onTap: (String answer) {
                ///
                screen.ans = answer;

                /// BEFORE NAVIGATING TO NEXT PAGE FILL ALL DATA IN VARIABLES
                screenViewModel.getAllData();

                ///NAVIGATE TO FINAL PAGE
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FinalScreen();
                    },
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenViewModel>(
      builder: (context, _, __) {
        return Material(
          child: screenViewModel.isLoading
              ? Container(
                  color: AppColors.headerColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///
                      const CircularProgressIndicator(),

                      ///
                      const SizedBox(
                        height: 20.0,
                      ),

                      ///
                      Text(
                        AppStrings.welcomeToElreio,
                        style: AppTextStyle.questionTextStyle,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
