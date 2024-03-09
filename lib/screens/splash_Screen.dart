import 'package:flutter/material.dart';
import 'package:instagram/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigashen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/pattern1.png'),
              repeat: ImageRepeat.repeat)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Center(
                    child: Image(
                      image: AssetImage('images/logo_splash.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                child: Column(
                  children: [
                    Text(
                      'from',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Datiego',
                      style: TextStyle(color: Color(0xff55B9F7)),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Future<void> navigashen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LoginScreen();
      },
    ));
  }
}
