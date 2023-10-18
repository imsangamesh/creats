import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHelper {
  static String get genDateId =>
      'genId: ${DateTime.now().toIso8601String()}|||${DateTime.now().toIso8601String()}|||${DateTime.now().toIso8601String()}';

  static String profilePic =
      'https://img.freepik.com/premium-psd/3d-cartoon-avatar-smiling-man_1020-5130.jpg?size=338&ext=jpg&uid=R65626931&ga=GA1.2.1025021015.1655558182&semt=sph';

  static enumToString(dynamic enumData) => enumData.toString().split('.')[1];

  static final lightTextTheme = GoogleFonts.rubikTextTheme().copyWith(
    bodyMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    bodyLarge:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    displayLarge:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    displayMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    displaySmall:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    headlineMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    headlineSmall:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    titleLarge:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    titleMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
    titleSmall:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.black)),
  );

  static final darkTextTheme = GoogleFonts.rubikTextTheme().copyWith(
    bodyMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    bodyLarge:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    displayLarge:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    displayMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    displaySmall:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    headlineMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    headlineSmall:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    titleLarge:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    titleMedium:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
    titleSmall:
        GoogleFonts.rubik(textStyle: const TextStyle(color: Colors.white)),
  );
}
