import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/screens%20/prayerList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerSuccess extends StatelessWidget {
  PrayerReqController prayerReqController = Get.find();

  PrayerSuccess({Key? key}) : super(key: key);
  var userId;
  getUserInformation() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    userId = localStorage.get("id");
    prayerReqController.getPrayers(userId);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF242778),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                  child: Image.asset(
                    "assets/tick.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Successfully Sent",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Your Prayer is Successful received. We are here with you",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 10,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(45),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          child: Text(
                            " In the beginning was the Word, and the Word was with God, and the Word was God.",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(
                          "isaiah 41:10",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                letterSpacing: .5,
                                fontSize: 7,
                                fontWeight: FontWeight.w200),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() => {
                        getUserInformation(),
                        Get.off(() => PrayerList(url: "assets/hands.png"))
                      }),
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xFF014783),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text("Done",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                                fontSize: 15,
                                fontWeight: FontWeight.w200),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
