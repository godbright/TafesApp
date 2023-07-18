import 'package:flutter/material.dart';

// const String baseURL = "http://10.0.2.2:8000/api/";

// ignore: constant_identifier_names
// const String del_url = "http://10.0.2.2:8000/api/comment/delete/";
// const String categoryURL = "http://10.0.2.2:8000/api/dashboard/";
const Map<String, String> headers = {"Content-Type": "application/json"};
// const String imageUrl = "http://10.0.2.2:8000/storage/images/";

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 3),
  ));
}

messageSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(text),
    duration: const Duration(seconds: 3),
  ));
}

// IOS API'S
const String baseURL = "http://tafesaru.afyasasa.io/api/";
const String categoryURL = "http://tafesaru.afyasasa.io/api/dashboard/";
const String imageUrl = "http://tafesaru.afyasasa.io/api/images/";
// ignore: constant_identifier_names
const String del_url = "http://tafesaru.afyasasa.io/api/comment/delete/";
const String daily_scr = "https://labs.bible.org/api/?passage=votd&type=json";
