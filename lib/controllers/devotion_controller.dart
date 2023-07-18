import 'dart:convert';

import 'package:aru_news/Services/api.dart';
import 'package:aru_news/Services/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevotionController extends GetxController {
  var devotionList = [].obs;
  var isloading = false.obs;

  successMessage(msg) {
    Get.snackbar(
      "Message",
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  errorMessage(msg) {
    Get.snackbar(
      "Message",
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  getDailyScript() async {
    try {
      var response = await CallApi().getScript(daily_scr);
      isloading.value = true;
      var response_data = json.decode(response.body);
      devotionList.value = response_data;
      isloading.value = false;
    } catch (e) {
      print(e);
      // TODO
    }
  }
}
