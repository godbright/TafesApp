import 'package:aru_news/screens%20/daily_devotion.dart';
import 'package:aru_news/screens%20/news.dart';
import 'package:aru_news/screens%20/offerings.dart';
import 'package:aru_news/screens%20/prayer.dart';
import 'package:aru_news/screens%20/programs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Services extends StatelessWidget {
  String url;
  String desc;
  String title;
  String screenName;
  Services({
    required this.url,
    required this.title,
    required this.desc,
    required this.screenName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            if (screenName == "prayer") {
              Get.to(() => PrayerRequest(url: url, desc: desc, title: title));
            } else if (screenName == "devotion") {
              Get.to(() => Devotion(url: url, desc: desc, title: title));
            } else if (screenName == "programs") {
              Get.to(() => Programs(url: url, desc: desc, title: title));
            } else if (screenName == "offering") {
              Get.to(() => Offerings(url: url, desc: desc, title: title));
            } else if (screenName == "socials") {
              Get.to(() => News());
            }
          }),
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(3, 10, 3, 10),
            decoration: BoxDecoration(
              color: Color(0xFF292D89),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Center(
                child: Image.asset(
              url,
              width: 30,
              height: 30,
            )),
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ))
      ],
    );
  }
}
