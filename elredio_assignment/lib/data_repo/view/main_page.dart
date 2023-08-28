import 'dart:developer';

import 'package:elredio_assignment/constants/colors.dart';
import 'package:elredio_assignment/constants/strings.dart';
import 'package:elredio_assignment/constants/textstyle.dart';
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
      /// PARSE JSON
      screenViewModel.getListOfScreens(json: AppStrings.json).then((value) {
        ///
        // if (screenViewModel.incrementIndex()) {
        // log("1 Increment Index ${screenViewModel.currentIndex}");

        ///
        // screenViewModel.screenList[screenViewModel.currentIndex].ans = answer;

        ///
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return Consumer<ScreenViewModel>(builder: (context, _, __) {
        //       return ParseWidget(
        //         answer: screenViewModel
        //                     .screenList[screenViewModel.currentIndex].ans ==
        //                 "null"
        //             ? ""
        //             : screenViewModel
        //                     .screenList[screenViewModel.currentIndex].ans ??
        //                 "",
        //         onBackPress: () {
        //           ///
        //           screenViewModel.decrementIndex();
        //           log("2 Decrement Index ${screenViewModel.currentIndex}");
        //         },
        //         totalProgress: screenViewModel.screenList.length,
        //         currentProgressIndex: screenViewModel.currentIndex,
        //         showBackButton: screenViewModel.currentIndex != 0,
        //         screenName: screenViewModel
        //             .screenList[screenViewModel.currentIndex].screenName,
        //         heading: screenViewModel
        //             .screenList[screenViewModel.currentIndex].heading,
        //         question: screenViewModel
        //             .screenList[screenViewModel.currentIndex].question,
        //         fieldType: screenViewModel
        //             .screenList[screenViewModel.currentIndex].fields,
        //         hintText: screenViewModel
        //             .screenList[screenViewModel.currentIndex].hintText,
        //         options: screenViewModel
        //             .screenList[screenViewModel.currentIndex].options,
        //         onTap: (String answer) {
        //           ///
        //           screenViewModel.incrementIndex();
        //           log("2 Increment Index ${screenViewModel.currentIndex}");

        //           ///
        //           screenViewModel.screenList[screenViewModel.currentIndex].ans =
        //               answer;
        //         },
        //       );
        //     });
        //   },
        // ));

        // }
        nextPage();
      });
    });
  }

  nextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Consumer<ScreenViewModel>(builder: (context, _, __) {
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
              totalProgress: screenViewModel.screenList.length,
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
                if (screenViewModel.incrementIndex()) {
                  log("2 Increment Index ${screenViewModel.currentIndex}");

                  ///
                  screenViewModel.screenList[screenViewModel.currentIndex].ans =
                      answer;

                  ///
                  nextPage();
                }
              },
            );
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenViewModel>(builder: (context, _, __) {
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
        //  ParseWidget(
        //     answer: screenViewModel
        //                 .screenList[screenViewModel.currentIndex].ans ==
        //             "null"
        //         ? ""
        //         : screenViewModel
        //                 .screenList[screenViewModel.currentIndex].ans ??
        //             "",
        //     onBackPress: () {},
        //     totalProgress: screenViewModel.screenList.length,
        //     currentProgressIndex: screenViewModel.currentIndex,
        //     showBackButton: screenViewModel.currentIndex != 0,
        //     screenName: screenViewModel
        //         .screenList[screenViewModel.currentIndex].screenName,
        //     heading: screenViewModel
        //         .screenList[screenViewModel.currentIndex].heading,
        //     question: screenViewModel
        //         .screenList[screenViewModel.currentIndex].question,
        //     fieldType: screenViewModel
        //         .screenList[screenViewModel.currentIndex].fields,
        //     hintText: screenViewModel
        //         .screenList[screenViewModel.currentIndex].hintText,
        //     options: screenViewModel
        //         .screenList[screenViewModel.currentIndex].options,
        //     onTap: (String answer) {
        //       ///
        //       if (screenViewModel.incrementIndex()) {
        //         log("1 Increment Index ${screenViewModel.currentIndex}");

        //         ///
        //         screenViewModel
        //             .screenList[screenViewModel.currentIndex].ans = answer;

        //         ///
        //         Navigator.push(context, MaterialPageRoute(
        //           builder: (context) {
        //             return Consumer<ScreenViewModel>(
        //                 builder: (context, _, __) {
        //               return ParseWidget(
        //                 answer: screenViewModel
        //                             .screenList[
        //                                 screenViewModel.currentIndex]
        //                             .ans ==
        //                         "null"
        //                     ? ""
        //                     : screenViewModel
        //                             .screenList[
        //                                 screenViewModel.currentIndex]
        //                             .ans ??
        //                         "",
        //                 onBackPress: () {
        //                   ///
        //                   screenViewModel.decrementIndex();
        //                   log("2 Decrement Index ${screenViewModel.currentIndex}");
        //                 },
        //                 totalProgress: screenViewModel.screenList.length,
        //                 currentProgressIndex: screenViewModel.currentIndex,
        //                 showBackButton: screenViewModel.currentIndex != 0,
        //                 screenName: screenViewModel
        //                     .screenList[screenViewModel.currentIndex]
        //                     .screenName,
        //                 heading: screenViewModel
        //                     .screenList[screenViewModel.currentIndex]
        //                     .heading,
        //                 question: screenViewModel
        //                     .screenList[screenViewModel.currentIndex]
        //                     .question,
        //                 fieldType: screenViewModel
        //                     .screenList[screenViewModel.currentIndex]
        //                     .fields,
        //                 hintText: screenViewModel
        //                     .screenList[screenViewModel.currentIndex]
        //                     .hintText,
        //                 options: screenViewModel
        //                     .screenList[screenViewModel.currentIndex]
        //                     .options,
        //                 onTap: (String answer) {
        //                   ///
        //                   screenViewModel.incrementIndex();
        //                   log("2 Increment Index ${screenViewModel.currentIndex}");

        //                   ///
        //                   screenViewModel
        //                       .screenList[screenViewModel.currentIndex]
        //                       .ans = answer;
        //                 },
        //               );
        //             });
        //           },
        //         ));
        //       }
        //     },
        //   ),
      );
    });
  }
}
