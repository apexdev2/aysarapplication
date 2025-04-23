import 'package:flutter/material.dart';

const Color linkColor = Color(0xff0893DF);
const Color actionColor = Color(0xffEAD428);

// ignore: constant_identifier_names
const int OTP_CODE_LENGTH = 4;

const double defaultLat = 31.5359232;
const double defaultLon = 34.48832;

const Color appGreenColor = Color(0xff0CAF60);
const Color appRedColor = Color(0xffF1416C);

const Color successColor = Color(0xff0CAF60);
const Color failColor = Color(0xffE04E4E);

extension HexColor on Colors {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

TextStyle textStyle({
  double fontSize = 14.0, // Default size
  FontWeight fontWeight = FontWeight.normal, // Default weight
  Color color = Colors.black, // Default color
}) {
  return TextStyle(
    fontFamily: 'MontserratArabic', // Use the registered font family
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

//  List<Appointment> appointmentsData = [
//   Appointment(
//     date: DateTime(2024, 10, 28),
//     time: "10:30 AM",
//     friendsCount: 2,
//   ),
//   Appointment(
//     date: DateTime(2024, 11, 5),
//     time: "02:00 PM",
//     friendsCount: 3,
//   ),
//   Appointment(
//     date: DateTime(2024, 12, 1),
//     time: "05:45 PM",
//     friendsCount: 1,
//   ),
// ];
// List of Appointment objects with dummy data
DateTime initialTime = DateTime(
    DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0);
