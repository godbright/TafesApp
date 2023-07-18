import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/screens%20/LandingPage.dart';
import 'package:aru_news/screens%20/home.dart';
import 'package:aru_news/screens%20/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  PrayerReqController prayerReqController = Get.find();
  String? userId;
  bool islog = false;
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("id");

    userId == null
        ? setState(() {
            islog = false;
          })
        : setState(() {
            islog = true;
            prayerReqController.getUserInformation();
          });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: islog == true ? LandingPage() : LoginPage(),
    ));
  }
}
