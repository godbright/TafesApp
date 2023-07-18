import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevotionWidget extends StatelessWidget {
  String quote;
  String verse;

  DevotionWidget({Key? key, required this.quote, required this.verse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Verse of the day",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 10,
                      fontWeight: FontWeight.w300))),
          SizedBox(
            height: 10,
          ),
          Text(quote,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(verse,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 10,
                        fontWeight: FontWeight.w300))),
          ),
        ],
      ),
    );
  }
}
