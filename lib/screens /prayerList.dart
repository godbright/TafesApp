import 'package:aru_news/controllers/prayereq_controller.dart';
import 'package:aru_news/screens%20/prayer.dart';
import 'package:aru_news/widgets/prayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:date_format/date_format.dart';

class PrayerList extends StatefulWidget {
  String url = "";
  String desc = "";
  String title = "";
  PrayerList({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<PrayerList> createState() => _PrayerListState();
}

class _PrayerListState extends State<PrayerList> {
  @override
  Widget build(BuildContext context) {
    PrayerReqController prayerReqController = Get.find();
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
            height: height,
            child: Column(
              children: [
                Text("Prayer Requests",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    )),
                Container(
                  margin: EdgeInsets.all(20),
                  width: width * 0.9,
                  height: height * 0.4,
                  child: Obx(() {
                    return prayerReqController.prayerRequests.length == 0
                        ? Center(
                            child: Text("You don't have any prayer requests",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w200),
                                )))
                        : prayerReqController.loading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                            : ListView.builder(
                                itemCount:
                                    prayerReqController.prayerRequests.length,
                                itemBuilder: ((context, index) {
                                  return Prayers(
                                    width: width,
                                    prayer: prayerReqController
                                        .prayerRequests[index].prayer,
                                    created_at: formatDate(
                                        prayerReqController
                                            .prayerRequests[index].createdAt,
                                        [d, '-', M, '-', yy]).toString(),
                                  );
                                }));
                  }),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => PrayerRequest(
                      url: widget.url, desc: widget.desc, title: widget.title)),
                  child: Container(
                      width: 200,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF014783),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("New Prayer",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: .5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200),
                              )),
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
