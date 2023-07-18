import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Accounts extends StatelessWidget {
  const Accounts({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.9,
      width: width,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              // decoration: BoxDecoration(
              //   color: Color(0xFF242778),
              //   borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(10),
              //       topRight: Radius.circular(10),
              //       bottomLeft: Radius.circular(10),
              //       bottomRight: Radius.circular(10)),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.3),
              //       spreadRadius: 1,
              //       blurRadius: 10,
              //       offset: Offset(
              //           0, 0), // changes position of shadow
              //     ),
              //   ],
              // ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'MPESA ',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '0715123210',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      letterSpacing: .5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'NAME ',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'TAFES ARU',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      letterSpacing: .5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Image.asset(
                      "assets/tick.png",
                      width: 50,
                      height: 50,
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
