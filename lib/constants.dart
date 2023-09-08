import 'package:flutter/material.dart';

class Constants {
  static Size cardSize = const Size(400, 200);
  static Color indicatorColor = const Color.fromARGB(255, 216, 21, 216);
  static TextStyle buttonTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Quicksand');
  static TextStyle pageContentTextStyle = const TextStyle(
      fontSize: 15,
      color: Color.fromARGB(255, 35, 35, 35),
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w600);
  static TextStyle itemCardTextStyle = const TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 250, 249, 249),
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w600);
  static TextStyle listTitleTextStyle = const TextStyle(
      fontSize: 22,
      color: Color.fromARGB(255, 58, 58, 58),
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w600);
  static TextStyle listTileTextStyle = const TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 58, 58, 58),
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w600);
  static TextStyle drawerContentTextStyle = const TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 35, 35, 35),
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.bold);
  static TextStyle pageContentTitleTextStyleLight = const TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Quicksand',
      fontSize: 20,
      color: Color.fromARGB(255, 251, 244, 252));
  static TextStyle pageContentSubTitleTextStyleLight = const TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Quicksand',
      fontSize: 15,
      color: Color.fromARGB(255, 251, 244, 252));
  static TextStyle pageContentTitleTextStyleDark = const TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Quicksand',
      fontSize: 20,
      color: Color.fromARGB(255, 46, 45, 47));
  static ButtonStyle greenButtonStyle = const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
  );
  static TextStyle drawerTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Quicksand',
      fontSize: 20,
      color: Color.fromARGB(255, 46, 45, 47));
  static TextStyle textButtonTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Quicksand',
      fontSize: 20,
      color: Color.fromARGB(255, 46, 45, 47));
  static Size buttonSize = const Size(200, 60);
  static Color drawerBackgroundColor = const Color.fromARGB(255, 255, 253, 253);
  static TextStyle statusTextStyle = const TextStyle(
      fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w600);
  static const List<Color> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
}
