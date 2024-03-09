import 'package:flutter/material.dart';
import 'package:instagram/screens/activity_sceen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/mainscreen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/splash_Screen.dart';
import 'package:instagram/screens/switch_account_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
           
            primary: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 16),
          ),
        ),
        textTheme: TextTheme(
            headline4: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
               
                color: Colors.white
               )),
      ),
      home: SplashScreen(),
    );
  }
}
