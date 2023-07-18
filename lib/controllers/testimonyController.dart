import 'dart:convert';

import 'package:aru_news/Services/api.dart';
import 'package:aru_news/models/Prayer.dart';
import 'package:aru_news/screens%20/prayerSent.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class TestimonyController extends GetxController {
  var loading = false.obs;
  var prayerRequests = <Prayer>[].obs;

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

  var body;
  sendTestimony(data, url) async {
    try {
      loading.value = true;
  
      var res = await CallApi().postData(data, url);
      body = json.decode(res.body);
      if (body["status"] == 0) {
        loading.value = false;
        successMessage("Prayer Request Sent");
        Get.to(() => PrayerSuccess());
      } else if (body["status"] == 1) {
        loading.value = false;
        errorMessage("Prayer Enter all field");
      } else if (body["status"] == 2) {
        loading.value = false;
        errorMessage("Not authorized");
      } else if (body["status"] == 3) {
        loading.value = false;
        errorMessage("Please check your connection");
      }
    } catch (e) {
      loading.value = false;
      errorMessage("Check your connection");
    }
  }

  getTestimonies(id) async {
    try {
      loading.value = true;
      var res = await CallApi().getData("prayer/list/${id}");
      var jsonResponse = json.decode(res.body); // Parse the response body
      if (jsonResponse['status'] == 0) {
        var dataArray =
            jsonResponse['data']; // Access the 'data' array directly
        prayerRequests.value = prayerFromJson(
            json.encode(dataArray)); // Assign it to your variable
      }
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
