// ignore_for_file: unused_local_variable

import 'package:aru_news/screens%20/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin.dart';
import 'adverts.dart';
import 'others.dart';
import 'religion.dart';
import 'sports.dart';

// ignore: camel_case_types
class News extends StatefulWidget {
  const News({
    Key? key,
  }) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

// ignore: camel_case_types
class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  late TabController controller;
  // ignore: non_constant_identifier_names
  String? UserEmail;
  // ignore: non_constant_identifier_names
  String? Username;
  // ignore: non_constant_identifier_names
  String? Phone;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => const Notifications()));
        //       },
        //       icon: const Icon(
        //         Icons.notifications_outlined,
        //         color: Colors.white,
        //       ))
        // ],
        // title: Container(
        //   height: 5.h,
        //   width: 70.w,
        //   decoration: const BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.all(Radius.circular(10))),
        //   child: const TextField(
        //     cursorColor: Colors.black,
        //     decoration: InputDecoration(
        //         hintText: "Search for Information...",
        //         contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        //         border: InputBorder.none,
        //         prefixIcon: Icon(
        //           Icons.search,
        //           color: Colors.grey,
        //         )),
        //   ),
        // ),
        centerTitle: true,
        backgroundColor: Color(0xFF292D89),
        bottom: TabBar(
          padding: EdgeInsets.only(bottom: 3.w),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          controller: controller,
          labelColor: Colors.white,
          tabs: const [
            Tab(
              text: "Administration",
            ),
            Tab(
              text: "Religious",
            ),
            Tab(
              text: "Advertisements",
            ),
            Tab(
              text: "Sports",
            ),
            Tab(
              text: "Others",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [Admin(), Religion(), Adverts(), Sports(), Others()],
      ));
  // ignore: avoid_unnecessary_containers
}
