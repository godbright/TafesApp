import 'package:aru_news/controllers/devotion_controller.dart';
import 'package:aru_news/controllers/events_controller.dart';
import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/controllers/testimonyController.dart';
import 'package:aru_news/screens%20/auth_page.dart';
import 'package:aru_news/screens%20/home.dart';
import 'package:aru_news/screens%20/login.dart';
import 'package:aru_news/screens%20/onboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

// ignore: import_of_legacy_library_into_null_safe
// import 'package:splashscreen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) =>
      FlutterSizer(builder: (context, orientation, screenType) {
        TestimonyController testimonyController =
            Get.put(TestimonyController());
        EventsController eventsController = Get.put(EventsController());
        PrayerReqController prayerController = Get.put(PrayerReqController());
        DevotionController devotionController = Get.put(DevotionController());
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: AuthPage()),
        );
      });
}
