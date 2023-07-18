import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LimitedText extends StatelessWidget {
  String originalText;
  int wordLimit = 10;
  LimitedText({super.key, required this.originalText, required this.wordLimit});
  String limitWords(String text, int wordLimit) {
    List<String> words = text.split(' ');

    if (words.length <= wordLimit) {
      return text;
    } else {
      List<String> limitedWords = words.sublist(0, wordLimit);
      return limitedWords.join(' ') + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    String limitedText = limitWords(originalText, wordLimit);
    return Text(limitedText,
        style: GoogleFonts.poppins(fontSize: 12, color: Colors.white));
  }
}
