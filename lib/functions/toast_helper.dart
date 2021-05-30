import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastHelper {
  static void show(String text, BuildContext context,
      {Color color = Colors.green}) {
    showToast(
      text,
      duration: Duration(milliseconds: 3500),
      animation: StyledToastAnimation.slideFromTopFade,
      position: StyledToastPosition.top,
      textAlign: TextAlign.center,
      backgroundColor: color,
      borderRadius: BorderRadius.circular(12.0),
      context: context,
      dismissOtherToast: true,
    );
  }

  static void showException(String text, BuildContext context) {
    show(text, context, color: Colors.red);
  }
}
