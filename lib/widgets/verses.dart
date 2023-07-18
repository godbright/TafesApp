import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviousVerses extends StatelessWidget {
  String verse;
  String desc;
  String url;
  PreviousVerses({
    Key? key,
    required this.desc,
    required this.url,
    required this.verse,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: EdgeInsets.all(19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(verse,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF242778),
                      letterSpacing: .5,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.6,
                child: Text(desc,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(

                            // overflow: TextOverflow.ellipsis,
                            color: Color.fromARGB(255, 101, 100, 100)
                                .withOpacity(1),
                            letterSpacing: .5,
                            fontSize: 10,
                            fontWeight: FontWeight.w300))),
              ),
              //TODO User the url to share to someplace
              Image.asset(
                "assets/share.png",
                width: 20,
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
