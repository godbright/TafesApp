import 'package:aru_news/screens%20/admin.dart';
import 'package:aru_news/screens%20/adverts.dart';
import 'package:aru_news/screens%20/others.dart';
import 'package:aru_news/screens%20/religion.dart';
import 'package:aru_news/screens%20/sports.dart';
import 'package:aru_news/widgets/accounts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class Offerings extends StatefulWidget {
  String url;
  String desc;
  String title;

  Offerings(
      {Key? key, required this.url, required this.desc, required this.title})
      : super(key: key);

  @override
  State<Offerings> createState() => _OfferingsState();
}

class _OfferingsState extends State<Offerings>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF242778),
      ),
      backgroundColor: Color(0xFF242778),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
          child: Column(
            children: [
              Image.asset(
                widget.url,
                width: 100,
                height: 100,
              ),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(widget.desc,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 10,
                        fontWeight: FontWeight.w200),
                  )),
              SizedBox(
                height: 10,
              ),
              TabBar(
                padding: EdgeInsets.only(bottom: 3.w),
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                controller: controller,
                labelColor: Colors.white,
                tabs: const [
                  Tab(
                    text: "Accounts",
                  ),
                  Tab(
                    text: "Tithe",
                  ),
                  Tab(
                    text: "Pledge",
                  ),
                  Tab(
                    text: "Offerings",
                  ),
                ],
              ),
              Container(
                width: width,
                height: height * 0.9,
                child: TabBarView(
                  controller: controller,
                  children: [
                    Accounts(height: height, width: width),
                    Text("Tithe"),
                    Text("Pledge"),
                    Text("Offering"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
