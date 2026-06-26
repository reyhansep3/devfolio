import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontStyle {
  //white
  static TextStyle borelVeryLargeText2 = GoogleFonts.borel(
      color: Colors.white, fontSize: 40, );

  static TextStyle borelVeryLargeText = GoogleFonts.borel(
      color: Colors.white, fontSize: 35, );

  static TextStyle borelLargeText = GoogleFonts.borel(
      color: Colors.white, fontSize: 25, );
  
  static TextStyle borelMediumText = GoogleFonts.borel(
      color: Colors.white, fontSize: 20, );
  
  static TextStyle borelSmallText = GoogleFonts.borel(
      color: Colors.white, fontSize: 15, );

  static TextStyle veryLargeText = GoogleFonts.poppins(
      color: Colors.white, fontSize: 35,);

  static TextStyle largeText2 = GoogleFonts.poppins(
      color: Colors.white, fontSize: 30,);

  static TextStyle largeText = GoogleFonts.poppins(
      color: Colors.white, fontSize: 25, );
  
   static TextStyle mediumText2 = GoogleFonts.inter(
      color: Colors.white, fontSize: 20, );

  static TextStyle mediumText = GoogleFonts.inter(
      color: Colors.white, fontSize: 18, );
  
  static TextStyle smallText = GoogleFonts.poppins(
      color: Colors.white, fontSize: 15, );
  
  static TextStyle verySmallText = GoogleFonts.poppins(
      color: Colors.white, fontSize: 12, );

  static TextStyle smallTextPSP = GoogleFonts.pressStart2p(
    color: Colors.white, fontSize: 15,
  );

  static TextStyle mediumTextPSP = GoogleFonts.pressStart2p(
    color: Colors.white, fontSize: 18,
  );
  
  static TextStyle mediumTextPSP2 = GoogleFonts.pressStart2p(
    color: Colors.white, fontSize: 20,
  );

  static TextStyle largeTextMono = const TextStyle(
    fontFamily: 'vcr_osd_mono',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mediumTextMono = const TextStyle(
    fontFamily: 'vcr_osd_mono',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
