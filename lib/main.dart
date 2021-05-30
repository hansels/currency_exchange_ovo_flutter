import 'package:exchange_currency_ovo_flutter/configs/configs.dart';
import 'package:exchange_currency_ovo_flutter/screens/home/home_screen.dart';
import 'package:exchange_currency_ovo_flutter/widgets/custom/animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Configs.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Svenska",
        primaryColor: Configs.primaryColor,
        accentColor: Configs.secondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (context) {
          return AnimatedSplash.styled(
            imagePath: "assets/logo.png",
            duration: 2000,
            customFunction: splashScreen(context),
            curve: Curves.easeInOutCirc,
            style: AnimationStyle.FadeIn,
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }

  static Future<Widget> splashScreen(BuildContext context) async {
    return HomeScreen();
  }
}
