import 'dart:convert';
import 'dart:developer';

import 'package:elredio_assignment/data_repo/model/screen_model.dart';
import 'package:flutter/material.dart';

class ScreenViewModel extends ChangeNotifier {
  ///LIST OF SCREENS
  List<Screens> screenList = List.empty(growable: true);

  ///MAINTAIN INDEX TO CHANGE DATA
  int currentIndex = 0;

  ///
  bool isLoading = true;

  ///GET LIST OF SCREENS
Future<void>  getListOfScreens({required String json}) async {
    ///
    updateLoading(
      value: true,
    );

    ///
    await Future.delayed(const Duration(seconds: 2));

    ///PARSE JSON
    ScreenData screenData = ScreenData.fromJson(jsonDecode(json));

    ///
    log("data ${screenData.toJson()}");

    /// ADD LIST OF SCREEN
    screenList.addAll(screenData.screens ?? []);

    ///
    updateLoading(value: false);
  }

  ///TO UPDATE LOADING STATUS
  updateLoading({required bool value}) {
    isLoading = value;
    notifyListeners();
  }

  ///
  bool incrementIndex() {
    if (screenList.length - 1 > currentIndex) {
      currentIndex++;
      notifyListeners();
      return true;
    }
    return false;
  }

  ///
  bool decrementIndex() {
    if (currentIndex > 0) {
      currentIndex--;
      notifyListeners();
      return true;
    }
    return false;
  }
}
