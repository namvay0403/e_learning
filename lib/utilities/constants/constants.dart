import 'package:flutter/material.dart';

class AppAssets {
  static String elearning = 'assets/images/elearning.png';
  static String facebook = 'assets/images/facebook.png';
  static String google = 'assets/images/google.png';
  static String phone = 'assets/images/phone.png';
  static String logo = 'assets/images/logo.png';
  static String avatar = 'assets/images/avatar.jpg';
  static String heart = 'assets/images/heart.png';
  static String schedule = 'assets/images/schedule.png';
  static String history = 'assets/images/history.png';
  static String courses = 'assets/images/courses.png';
}

const fontApp = "GoogleSans-Regular";
const fontBoldApp = "GoogleSans-Bold";

const baseUrl = 'https://sandbox.api.lettutor.com/';

class fontSize {
  static const double large = 24;
  static const double medium = 15;
  static const double textField = 14;
}

class padding {
  static const double large = 15;
  static const double medium = 12;
  static const double small = 8;
}

class colorProject {
  static const Color primaryColor = Colors.blue;
  static const Color subColor = Color(0xFF696969);
  static const Color smallTitle = Colors.black;
}

class textStyle {
  static TextStyle normalStyle(
      {double fontSize = 14, Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontApp,
      color: color,
    );
  }

  static TextStyle headerStyle(
      {double fontSize = 24, Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontBoldApp,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}

class sizedBox {
  static SizedBox largeHeight() {
    return const SizedBox(
      height: 20,
    );
  }

  static SizedBox mediumHeight() {
    return const SizedBox(
      height: 15,
    );
  }

  static SizedBox smallHeight() {
    return const SizedBox(
      width: 10,
    );
  }

  static SizedBox largeWidth() {
    return const SizedBox(
      width: 15,
    );
  }

  static SizedBox mediumWidth() {
    return const SizedBox(
      height: 10,
    );
  }

  static SizedBox smallWidth() {
    return const SizedBox(
      width: 8,
    );
  }
}
