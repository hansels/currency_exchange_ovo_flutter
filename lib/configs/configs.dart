import 'package:flutter/material.dart';

class Configs {
  static String appName = "EX-Currency";

  //Colors for theme
  static const primaryColor = Color.fromRGBO(245, 168, 54, 1);
  static const secondaryColor = Color.fromRGBO(250, 230, 169, 1);

  static const Color linkColor = Color(0XFF0000EE);
  static const String httpLink = "34.101.97.182:3000";

  static const double screenPadding = 20.0;

  static const EdgeInsets screenEdgeInsets = EdgeInsets.symmetric(
    vertical: Configs.screenPadding / 1.5,
    horizontal: Configs.screenPadding,
  );
}
