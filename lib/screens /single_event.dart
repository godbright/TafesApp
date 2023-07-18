import 'package:aru_news/Services/globals.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class SingleEvent extends StatefulWidget {
  String id;
  String venue;
  String image;
  String title;
  String descr;
  DateTime date;

  SingleEvent({
    super.key,
    required this.venue,
    required this.id,
    required this.date,
    required this.descr,
    required this.image,
    required this.title,
  });

  @override
  State<SingleEvent> createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width, // Specify the desired width of the container
              height: size.height *
                  0.5, // Specify the desired height of the container
              child: Image.network(
                imageUrl + widget.image, // Replace with your network image URL
                fit: BoxFit
                    .contain, // Adjust the fit property as per your requirement
              ),
            ),
            Positioned(
              top: 26,
              left: 10,
              child: GestureDetector(
                onTap: (() => Get.back()),
                child: Icon(
                  Ionicons.arrow_back,
                  color: Color(0xFF242778),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                height: size.height * 0.55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(height: size.height * 0.02),
                      // Row(
                      //   children: [
                      //     Image.asset("assets/message.png",
                      //         width: size.width * 0.04,
                      //         height: size.height * 0.05),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     // Text(
                      //     //   widget.comment.toString() + " Comments",
                      //     //   style:
                      //     //       GoogleFonts.poppins(color: Color(0xFF242778)),
                      //     // )
                      //   ],
                      // ),
                      Text(
                        "Description",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),

                      SizedBox(
                        width: size.width * 0.9,
                        height: size.height * 0.28,
                        child: Text(
                          widget.descr,
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Venue: ",
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          Text(this.widget.venue,
                              style: GoogleFonts.poppins(fontSize: 12)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Date: ",
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          Text(
                            formatDate(this.widget.date, [
                              yyyy,
                              " ",
                              MM,
                              '  ',
                              'at',
                              '  ',
                              HH,
                              ':',
                              nn,
                            ]),
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 12,
              right: 12,
              child: Align(
                child: GestureDetector(
                  onTap: (() {
                    // likeController.getLikes(this.widget.id);
                    // commentController.getComments(this.widget.id);
                  }),
                  child: Container(
                      height: size.height / 14,
                      width: size.width * 0.9,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFF242778),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "Confirm Attendance",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
