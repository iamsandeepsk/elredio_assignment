import 'dart:convert';
import 'dart:developer';

import 'package:elredio_assignment/constants/api_endpoint.dart';
import 'package:elredio_assignment/data_repo/model/screen_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScreenViewModel extends ChangeNotifier {
  ///LIST OF SCREENS
  List<Screens> screenList = List.empty(growable: true);

  ///MAINTAIN INDEX TO CHANGE DATA
  int currentIndex = 0;

  ///
  bool isLoading = true;

  ///GET LIST OF SCREENS
  Future<void> getListOfScreens({required String json}) async {
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

  ///RESET DATA
  resetData() {
    currentIndex = 0;
    screenList.clear();
  }

  ///
  String? name;
  String? gender;
  String? dob;
  String? profession;
  String? technology;
  String? lastQuestion;

  ///
  getAllData() {
    if (screenList.isNotEmpty) {
      name = screenList.first.ans;
      gender = screenList[1].ans;
      dob = screenList[2].ans;
      profession = screenList[3].ans;
      if (screenList[currentIndex].childScreen != null) {
        /// NAVIGATE TO CHILD AS PER LAST ANSWER

        if (screenList.last.ans?.contains("frontend") ?? false) {
          ///
          if (screenList.last.childScreen?.frontend?.isNotEmpty ?? false) {
            technology = screenList.last.childScreen?.frontend?.first.ans;
            lastQuestion =
                screenList.last.childScreen?.frontend?.first.question;
          }
        } else if (screenList.last.ans?.contains("backend") ?? false) {
          ///
          if (screenList.last.childScreen?.backend?.isNotEmpty ?? false) {
            technology = screenList.last.childScreen?.backend?.first.ans;
            lastQuestion = screenList.last.childScreen?.backend?.first.question;
          }
        } else if (screenList.last.ans?.contains("design") ?? false) {
          ///
          if (screenList.last.childScreen?.designer?.isNotEmpty ?? false) {
            technology = screenList.last.childScreen?.designer?.first.ans;
            lastQuestion =
                screenList.last.childScreen?.designer?.first.question;
          }
        }
      }
    }
  }

  ///HTTP CLIENT FOR API REQUEST
  Client http = Client();

  ///
  Future<bool> postUserInformation() async {
    Map<String, dynamic> data = {
      "name": name,
      "gender": gender,
      "dob": dob,
      "profession": profession,
      "skills": technology
    };
    return await http
        .post(
      Uri.parse(ApiEngpoints.postUserInfo),
      body: data,
    )
        .then((value) {
      log("Request Response  ${value.body}");

      if (value.statusCode < 200 || value.statusCode > 200) {
        return false;
      } else {
        return true;
      }
    }).catchError((onError) {
      log("Request Error  $onError");
      return false;
    });
  }
}
