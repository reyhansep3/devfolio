import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontStyle {
  // --- BOREL FONT FAMILY ---
  static TextStyle borelDisplay = GoogleFonts.borel(
    color: Colors.white, 
    fontSize: 40,
  );

  static TextStyle borelHeadingLarge = GoogleFonts.borel(
    color: Colors.white, 
    fontSize: 35,
  );

  static TextStyle borelHeadingMedium = GoogleFonts.borel(
    color: Colors.white, 
    fontSize: 25,
  );
  
  static TextStyle borelBodyLarge = GoogleFonts.borel(
    color: Colors.white, 
    fontSize: 20,
  );
  
  static TextStyle borelBodyMedium = GoogleFonts.caveat(
    color: Colors.white, 
    fontSize: 15,
  );

  // --- POPPINS FONT FAMILY ---
  static TextStyle poppinsHeadingLarge = GoogleFonts.poppins(
    color: Colors.white, 
    fontSize: 35,
  );

  static TextStyle poppinsHeadingMedium = GoogleFonts.poppins(
    color: Colors.white, 
    fontSize: 30,
  );

  static TextStyle poppinsHeadingSmall = GoogleFonts.poppins(
    color: Colors.white, 
    fontSize: 25,
  );
  
  static TextStyle poppinsBodyMedium = GoogleFonts.poppins(
    color: Colors.white, 
    fontSize: 15,
  );
  
  static TextStyle poppinsBodySmall = GoogleFonts.poppins(
    color: Colors.white, 
    fontSize: 12,
  );

  // --- INTER FONT FAMILY ---
  static TextStyle interBodyLarge = GoogleFonts.inter(
    color: Colors.white, 
    fontSize: 20,
  );

  static TextStyle interBodyMedium = GoogleFonts.inter(
    color: Colors.white, 
    fontSize: 18,
  );

  // --- PRESS START 2P FONT FAMILY ---
  static TextStyle pressStartHeadingSmall = GoogleFonts.pressStart2p(
    color: Colors.white, 
    fontSize: 20,
  );

  static TextStyle pressStartBodyLarge = GoogleFonts.pressStart2p(
    color: Colors.white, 
    fontSize: 18,
  );

  static TextStyle pressStartBodyMedium = GoogleFonts.pressStart2p(
    color: Colors.white, 
    fontSize: 15,
  );

  // --- SHADOWS INTO LIGHT FONT FAMILY ---
  static TextStyle shadowLightHeadingSmall = GoogleFonts.shadowsIntoLight(
    color: Colors.white, 
    fontSize: 20,
  );

  static TextStyle shadowLightBodyLarge = GoogleFonts.shadowsIntoLight(
    color: Colors.white, 
    fontSize: 18,
  );

  static TextStyle shadowLightBodyMedium = GoogleFonts.shadowsIntoLight(
    color: Colors.white, 
    fontSize: 15,
  );
  
  // --- JERSEY 10 FONT FAMILY ---
  static TextStyle jerseyHeadingSmall = GoogleFonts.getFont(
    'Jersey 10',
    color: Colors.white, 
    fontSize: 20,
  );

  static TextStyle jerseyBodyLarge = GoogleFonts.getFont(
    'Jersey 10',
    color: Colors.white, 
    fontSize: 18,
  );

  static TextStyle jerseyBodyMedium = GoogleFonts.getFont(
    'Jersey 10',
    color: Colors.white, 
    fontSize: 15,
  );

  static TextStyle jerseyBodySmall = GoogleFonts.getFont(
    'Jersey 10',
    color: Colors.white, 
    fontSize: 12,
  );

  // --- CUSTOM MONO FONT FAMILY ---
  static TextStyle vcrMonoHeadingSmall = const TextStyle(
    fontFamily: 'vcr_osd_mono',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Menambahkan warna agar konsisten dengan yang lain
  );

  static TextStyle vcrMonoBodyLarge = const TextStyle(
    fontFamily: 'vcr_osd_mono',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Menambahkan warna agar konsisten dengan yang lain
  );
}
