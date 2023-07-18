import 'package:aru_news/Services/globals.dart';
import 'package:aru_news/screens%20/single_event.dart';
import 'package:aru_news/widgets/limited_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoUpdates extends StatelessWidget {
  String url;
  String venue;
  String title;
  String id;
  DateTime date;
  String desc;
  VideoUpdates({
    Key? key,
    required this.venue,
    required this.desc,
    required this.url,
    required this.title,
    required this.date,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          Get.to(() => SingleEvent(
                venue: this.venue,
                date: this.date,
                descr: this.desc,
                id: this.id,
                image: this.url,
                title: this.title,
              ));
        },
        child: Column(children: [
          Container(
            width: width *
                0.4, // Adjust the width property as per your requirement
            height: 90,

            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl + url, // Replace with your network image URL

                  fit: BoxFit
                      .cover, // Adjust the fit property as per your requirement
                )),
          ),
          Container(
            width: width * 0.4,
            margin: EdgeInsets.symmetric(vertical: 4),
            constraints: BoxConstraints(
              maxWidth: width * 0.4, // Set the maximum width here
            ),
            child: Text(title,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      overflow: TextOverflow.visible,
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: width * 0.4, // Set the maximum width here
            ),
            child: Text(
              desc,
              maxLines: 3,
              style: TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10),
            ),
          ),
        ]));
  }
}



      //  Column(
      //   children: [
      //     Container(
      //       width: width, // Adjust the width property as per your requirement
      //       height: 90,
      //       margin: EdgeInsets.symmetric(horizontal: 10),
      //       child: Column(children: [
      //         SizedBox(
      //           height: 10,
      //         ),
      //         ClipRRect(
      //           borderRadius: BorderRadius.circular(10.0),
      //           child: Image.network(
      //             imageUrl + url,
      //             width: 100,
      //             height: 100,

      //             fit: BoxFit
      //                 .cover, // Adjust the fit property as per your requirement
      //           ),
      //         ),

      //         Container(
      //           margin: EdgeInsets.symmetric(vertical: 2),
      //           constraints: BoxConstraints(
      //             maxWidth: 120, // Set the maximum width here
      //           ),
      //           child: Text(title,
      //               maxLines: 1,
      //               style: GoogleFonts.poppins(
      //                 textStyle: TextStyle(
      //                     overflow: TextOverflow.visible,
      //                     color: Colors.white,
      //                     letterSpacing: .5,
      //                     fontSize: 9,
      //                     fontWeight: FontWeight.bold),
      //               )),
      //         ),

      //         Container(
      //           constraints: BoxConstraints(
      //             maxWidth: 120, // Set the maximum width here
      //           ),
      //           child: Text(
      //             desc,
      //             maxLines: 3,
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 overflow: TextOverflow.ellipsis,
      //                 fontSize: 10),
      //           ),
      //         ),
      //         // Text(
      //         //   desc,
      //         //   style: TextStyle(color: Colors.white, overflow: TextOverflow.visible),
      //         // )

      //         // LimitedText(
      //         //   originalText: desc,
      //         //   wordLimit: 4,
      //         // )
      //       ]),
      //     ),
      //   ],
      // ),
  