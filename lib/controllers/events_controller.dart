import 'dart:convert';

import 'package:aru_news/Services/api.dart';
import 'package:aru_news/models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  var loading = false.obs;
  var events_programs = <Event>[].obs;

  @override
  void onInit() {
    loading.value = false;
    super.onInit();
  }

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

  getEvents(date) async {
    try {
      loading.value = true;
      var res = await CallApi().getData("search/${date}");

      var jsonResponse = json.decode(res.body); // Parse the response body

      if (jsonResponse['status'] == 0) {
        var dataArray =
            jsonResponse['data']; // Access the 'data' array directly
        events_programs.value =
            eventFromJson(json.encode(dataArray)); // Assign it to your variable
      }
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }

  getImage(url) async {
    try {
      loading.value = true;
      var res = await CallApi().getData("images/${url}");

      var jsonResponse = json.decode(res.body); // Parse the response body

      if (jsonResponse['status'] == 0) {
        var dataArray =
            jsonResponse['data']; // Access the 'data' array directly
        events_programs.value =
            eventFromJson(json.encode(dataArray)); // Assign it to your variable
      }
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
