import 'dart:developer';

import 'package:elredio_assignment/constants/colors.dart';
import 'package:elredio_assignment/constants/strings.dart';
import 'package:elredio_assignment/constants/textstyle.dart';
import 'package:elredio_assignment/data_repo/model/screen_model.dart';
import 'package:elredio_assignment/data_repo/view/custom_button.dart';
import 'package:elredio_assignment/data_repo/view/custom_radio_button.dart';
import 'package:elredio_assignment/data_repo/view/custom_textfield.dart';
import 'package:elredio_assignment/data_repo/view_model/screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ParseWidget extends StatefulWidget {
  const ParseWidget({
    Key? key,
    this.screenName,
    this.heading,
    this.question,
    this.fieldType,
    this.options,
    this.hintText,
    required this.showBackButton,
    required this.onTap,
    required this.currentProgressIndex,
    required this.totalProgress,
    required this.onBackPress,
    required this.answer,
  }) : super(key: key);

  ///
  final String? screenName;
  final String? heading;
  final String? question;
  final String? fieldType;
  final List<Options>? options;
  final String? hintText;
  final Function(String) onTap;
  final Function() onBackPress;
  final bool showBackButton;
  final int currentProgressIndex;
  final int totalProgress;
  final String answer;

  @override
  State<ParseWidget> createState() => _ParseWidgetState();
}

class _ParseWidgetState extends State<ParseWidget> {
  ///
  final TextEditingController textEditingController = TextEditingController();

  ///
  final Widget space = const SizedBox(
    height: 20.0,
  );

  ///
  DateTime? date;

  ///
  String? answer;

  late ScreenViewModel screenViewModel;

  @override
  void initState() {
    super.initState();

    ///
    screenViewModel = Provider.of<ScreenViewModel>(context, listen: false);

    assignAnswer();
  }

  assignAnswer() {
    switch (widget.fieldType) {
      case "textfield":

        ///
        if (widget.answer.isNotEmpty) {
          textEditingController.text = widget.answer;
        }
        break;

      case "radio":
        answer = widget.answer;
        break;
      case "datefield":

        ///
        if (widget.answer.isNotEmpty) {
          date = DateTime.parse(widget.answer);
          textEditingController.clear();
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.showBackButton) {
          widget.onBackPress();
        }
        return true;
      },
      child: Scaffold(
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
                    mainAxisAlignment: widget.showBackButton
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      ///
                      widget.showBackButton
                          ? IconButton(
                              onPressed: () {
                                widget.onBackPress();
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.headerColor,
                              ),
                            )
                          : const SizedBox.shrink(),

                      ///
                      Text(
                        AppStrings.gamification,
                        style: AppTextStyle.gamificationTextStyle,
                      ),
                    ],
                  ),

                  ///
                  space,

                  ///
                  Text(
                    widget.heading ?? "",
                    style: AppTextStyle.headingTextStyle,
                  ),

                  ///
                  space,

                  ///
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.8,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.centerLeft,
                    clipBehavior: Clip.antiAlias,

                    child: Container(
                      width: (MediaQuery.of(context).size.width /
                              widget.totalProgress) *
                          widget.currentProgressIndex,
                      color: AppColors.questionColor,
                    ),
                  ),

                  ///
                  space,
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
                    Wrap(
                      children: [
                        ...List.generate(
                          widget.currentProgressIndex > 0
                              ? (widget.currentProgressIndex)
                              : 0,
                          (index) => Container(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "${screenViewModel.screenList[index].question} ",
                                style: AppTextStyle.textfieldTextStyle,
                                children: [
                                  TextSpan(
                                    text:
                                        screenViewModel.screenList[index].ans ??
                                            "",
                                    style: AppTextStyle.underLineTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    ///
                    widget.currentProgressIndex > 0 ? space : const SizedBox(),

                    ///
                    Text(
                      widget.question ?? "",
                      style: AppTextStyle.questionTextStyle,
                    ),

                    space,

                    ///
                    showWidget(
                      context: context,
                    ),

                    ///
                    const Spacer(),

                    ///
                    CustomeButton(
                      buttonName: AppStrings.next,
                      onTap: () {
                        validateInput(context: context);
                      },
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
      ),
    );
  }

  ///
  validateInput({required BuildContext context}) {
    switch (widget.fieldType) {
      case "textfield":
        if (textEditingController.text.trim().isEmpty) {
          ///
          showValidationMessage(
            message: AppStrings.nameValidation,
          );

          return false;
        }
        widget.onTap(textEditingController.text.trim());
        break;

      case "radio":
        if (answer == "" || (answer?.trim().isEmpty ?? true)) {
          ///
          showValidationMessage(
            message: AppStrings.pleaseSelectOneOption,
          );

          return false;
        }

        log("Answer $answer");
        widget.onTap(answer ?? "gg");
        break;

      case "datefield":
        if (textEditingController.text.trim().isEmpty) {
          ///
          showValidationMessage(
            message: AppStrings.pleaseSelectDate,
          );

          return false;
        }
        widget.onTap(textEditingController.text.trim());
        break;

      default:

        ///
        showValidationMessage(
          message: AppStrings.somethingWentWrong,
        );

        break;
    }
  }

  ///TO SHOW ERROR MESSAGE
  showValidationMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyle.headingTextStyle,
        ),
      ),
    );
  }

  ///
  Widget showWidget({required BuildContext context}) {
    switch (widget.fieldType) {
      case "textfield":
        return CustomTextField(
          textEditingController: textEditingController,
          hintText: widget.hintText ?? "",
        );

      case "radio":
        return CustomRadio(
          options: widget.options ?? [],
          ans: answer ?? "",
          onTap: (String? answer) {
            this.answer = answer;
            setState(() {});
          },
        );

      case "datefield":
        return InkWell(
          onTap: () async {
            date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1800),
              lastDate: DateTime.now(),
            );

            if (date != null) {
              textEditingController.text =
                  "${date?.year}-${date?.month}-${date?.day}";
              textEditingController.text =
                  DateFormat("yyyy-MM-dd").format(date!);
            }
          },
          child: CustomTextField(
            textEditingController: textEditingController,
            hintText: widget.hintText ?? "",
            isEnabled: false,
          ),
        );

      default:
        return Text(
          AppStrings.somethingWentWrong,
          style: AppTextStyle.buttonTextStyle,
        );
    }
  }
}
