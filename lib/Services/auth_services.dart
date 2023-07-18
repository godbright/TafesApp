// ignore_for_file: unused_local_variable, non_constant_identifier_names, duplicate_ignore

import 'dart:convert';

import 'package:aru_news/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static register(String username, String email, String phone, String password,
      associate, year) async {
    Map data = {
      "full_name": username,
      "email": email,
      "phone": phone,
      "password": password,
      "associate": associate,
      "year": year
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      // ignore: avoid_print
      print(response.body);
      return response;
    } catch (e) {
      print(e);
    }
  }

  static login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      // ignore: avoid_print
      print(response.body);

      // final SharedPreferences pref = await SharedPreferences.getInstance();
      //   // ignore: non_constant_identifier_names
      //   var id = pref.getString('id');
      //   var UserEmail = pref.getString('email');
      //   var Username = pref.getString('username');
      //   var Phone = pref.getString('phone');
      //   var body = json.encode(data);

      return response;
    } catch (e) {
      print(e);
    }
  }

  static edit(
      // ignore: duplicate_ignore
      String username,
      String email,
      String phone) async {
    Map data = {
      "username": username,
      "email": email,
      "phone": phone,
    };
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var id = pref.getString('id');
    var UserEmail = pref.getString('email');
    var Username = pref.getString('username');
    var Phone = pref.getString('phone');
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'edit/user/$id');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      // ignore: avoid_print
      print(response.body);

      return response;
    } catch (e) {
      // TODO
      print(e);
    }
  }

  static comment(
      // ignore: duplicate_ignore

      String username,
      String email,
      String postId,
      String comments) async {
    Map data = {
      "postId": postId,
      "comments": comments,
      "username": username,
      "email": email,
    };
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var body = json.encode(data);
    try {
      var url = Uri.parse(baseURL + 'post/comment');

      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      // ignore: avoid_print
      print(response.body);

      return response;
    } catch (e) {
      // TODO
      print(e);
    }
  }
}
