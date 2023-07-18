import 'package:aru_news/screens%20/news.dart';
import 'package:aru_news/screens%20/notification.dart';
import 'package:aru_news/screens%20/profile.dart';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home_Page> {
  int selectedIndex = 0;

//list of widgets to call ontap
  final screens = [
    const News(),
    const Notifications(),
    const Profile(),
  ];

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            backgroundColor: const Color(0XFF06599F),
            margin: const EdgeInsets.only(left: 10, right: 10),
            currentIndex: selectedIndex,
            dotIndicatorColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            // enableFloatingNavBar: false,
            onTap: (index) => setState(() => selectedIndex = index),
            items: [
              /// Home
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
                selectedColor: Colors.white,
                unselectedColor: Colors.white,
              ),

              /// Search
              DotNavigationBarItem(
                icon: const Icon(Icons.notifications),
                selectedColor: Colors.white,
                unselectedColor: Colors.white,
              ),

              /// Profile
              DotNavigationBarItem(
                icon: const Icon(Icons.person),
                unselectedColor: Colors.white,
                selectedColor: Colors.white,
              ),
            ],
          ),
        ),
        body: screens[selectedIndex]);
  }
}
