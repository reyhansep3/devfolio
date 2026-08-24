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

  // --- ANTONS FONT ---
   static TextStyle antonMedium = GoogleFonts.anton(
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

  static TextStyle poppinsBodyLarge = GoogleFonts.poppins(
    color: Colors.white, 
    fontSize: 18,
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

  // --- VT323 FONT FAMILY ---
  static TextStyle vtHeadingSmall = GoogleFonts.getFont(
    'VT323',
    color: Colors.white,
    fontSize: 20,
    letterSpacing: 0.5,
    height: 1.2,
  );

  static TextStyle vtBodyLarge = GoogleFonts.getFont(
    'VT323',
    color: Colors.white,
    fontSize: 18,
    letterSpacing: 0.5,
    height: 1.2,
  );

  static TextStyle vtBodyMedium = GoogleFonts.getFont(
    'VT323',
    color: Colors.white,
    fontSize: 15,
    letterSpacing: 0.5,
    height: 1.2,
  );

  static TextStyle vtBodySmall = GoogleFonts.getFont(
    'VT323',
    color: Colors.white,
    fontSize: 12,
    letterSpacing: 0.5,
    height: 1.2,
  );

  // --- CUSTOM MONO FONT FAMILY ---
  static TextStyle vcrMonoSmall = const TextStyle(
    fontFamily: 'vcr_osd_mono',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Menambahkan warna agar konsisten dengan yang lain
  );

  static TextStyle vcrMonoMedium = const TextStyle(
    fontFamily: 'vcr_osd_mono',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Menambahkan warna agar konsisten dengan yang lain
  );

  static TextStyle vcrMonoLArge = const TextStyle(
    fontFamily: 'vcr_osd_mono',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Menambahkan warna agar konsisten dengan yang lain
  );

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
