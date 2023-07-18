import 'package:aru_news/controllers/events_controller.dart';
import 'package:aru_news/widgets/limited_text.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Programs extends StatelessWidget {
  String url;
  String desc;
  String title;

  Programs(
      {Key? key, required this.url, required this.desc, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventsController eventsController = Get.find();
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
                url,
                width: 100,
                height: 100,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                desc,
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
                decoration: BoxDecoration(
                  color: Color(0xFF242778),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                      selectedDayHighlightColor: Colors.white,
                      controlsTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      selectedDayTextStyle: TextStyle(
                          color: Color(0xFF242778),
                          fontWeight: FontWeight.bold),
                      weekdayLabelTextStyle: const TextStyle(
                        color: Color(0XFF4F4F4F),
                        fontWeight: FontWeight.bold,
                      ),
                      dayTextStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  value: [],
                  onValueChanged: (value) {
                    eventsController
                        .getEvents(value[0]?.toString().split(" ")[0]);
                  },
                ),
              ),
              Obx(() {
                return Container(
                  height: height * 0.5,
                  width: width,
                  child: ListView.builder(
                      itemCount: eventsController.events_programs.length,
                      itemBuilder: ((context, index) {
                        return Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    eventsController
                                        .events_programs[index].title,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                LimitedText(
                                    originalText: eventsController
                                        .events_programs[index].body,
                                    wordLimit: 8),
                              ],
                            ),
                            Text(
                              eventsController.events_programs[index].time,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    letterSpacing: .5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        );
                      })),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
