import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/screens/mainscreen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1C1F2E),
        body: Column(
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/switch_account_background.png'),
                    fit: BoxFit.cover,
                  )),
                ),
                Positioned(
                  top: 180,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        height: 352,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ]),
                        ),
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: AssetImage('images/profile.jpg'),
                                height: 100,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Datiego',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 46,
                            width: 129,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return MainScreen();
                                  },
                                ));
                              },
                              child: Text('Confirm'),
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            'switch account',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            )),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? / ',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontFamily: 'GR'),
                  ),
                  Text(
                    ' Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'GR',
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
