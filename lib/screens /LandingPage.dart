import 'dart:convert';

import 'package:aru_news/screens%20/editprofile.dart';
import 'package:aru_news/screens%20/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List pages = [Home(), Edit()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //calling the post service to retrive posts

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: onTap,
          currentIndex: currentIndex,
          elevation: 20,
          selectedItemColor: Color(0xFF242778),
          unselectedItemColor: Colors.grey.withOpacity(0.9),
          items: [
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home)),
            // const BottomNavigationBarItem(
            //     label: "Posts", icon: Icon(Icons.backpack)),
            // const BottomNavigationBarItem(
            //     label: "Market place", icon: Icon(Icons.shopping_basket)),
            const BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.person)),
          ],
        ),
        body: pages[currentIndex]);
  }
}
