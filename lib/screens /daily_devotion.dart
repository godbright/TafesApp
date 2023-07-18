import 'package:aru_news/controllers/devotion_controller.dart';
import 'package:aru_news/screens%20/others.dart';
import 'package:aru_news/widgets/devotion.dart';
import 'package:aru_news/widgets/verses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class Devotion extends StatefulWidget {
  String url;
  String title;
  String desc;
  Devotion(
      {Key? key, required this.desc, required this.url, required this.title})
      : super(key: key);

  @override
  State<Devotion> createState() => _DevotionState();
}

class _DevotionState extends State<Devotion> {
  DevotionController devotionController = Get.find();

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
                this.widget.url,
                width: 100,
                height: 100,
              ),
              Text(
                this.widget.title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                this.widget.desc,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 10,
                      fontWeight: FontWeight.w200),
                ),
              ),
              DevotionWidget(
                verse: devotionController.devotionList[0]['bookname'] +
                    " " +
                    devotionController.devotionList[0]["chapter"] +
                    ":" +
                    devotionController.devotionList[0]["verse"],
                quote: devotionController.devotionList[0]["text"],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("Related Verses",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 15,
                            fontWeight: FontWeight.bold))),
              ),
              Container(
                width: width,
                height: height * 0.4,
                child: Obx(() {
                  return devotionController.devotionList.length == 0
                      ? LoadingScreen()
                      : ListView.builder(
                          itemCount: devotionController.devotionList.length,
                          itemBuilder: ((context, index) {
                            return PreviousVerses(
                              width: width,
                              desc: devotionController.devotionList[index]
                                  ['text'],
                              url: '',
                              verse: devotionController.devotionList[index]
                                      ["bookname"] +
                                  " " +
                                  devotionController.devotionList[index]
                                      ["chapter"] +
                                  ":" +
                                  devotionController.devotionList[index]
                                      ["verse"],
                            );
                          }));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
