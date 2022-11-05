import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:my_portfolio/screens/screenLayout/mobile_screen_layout.dart';
import 'package:my_portfolio/screens/screenLayout/web_screen_layout.dart';
import 'package:my_portfolio/utils/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Portfolio',
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
            // brightness: Brightness.dark,
            visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
            primaryColorLight: Colors.grey,
            primaryColorDark: Colors.black12,
            primarySwatch: Colors.blueGrey,
            fontFamily: 'Rubik'),
        home: LanguageBuilder(
          defaultLanguage: 'en',
          textsMap: const {},
          child: AnimatedSplashScreen(
              duration: 2000,
              splash: Image.asset(
                'images/dart.png',
                height: 600,
              ),
              nextScreen: const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebscreenLayout(),
              ),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: const Color(0xff0d0d2b)),
        ));
  }
}
