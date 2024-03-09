import 'package:flutter/material.dart';
import 'package:instagram/screens/switch_account_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    negahban1.addListener(() {
      setState(() {});
    });

    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff323A99),
              Color(0xffF98BFC),
            ]),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(alignment: Alignment.bottomCenter, children: [
          _getImageContainer(),
          _getContainerBox(),
        ]),
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 25,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Image(
                image: AssetImage('images/rocket.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in to ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'GR',
                        ),
                      ),
                      Image(image: AssetImage('images/mood.png'))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 44, right: 44, top: 30, bottom: 25),
                    child: TextField(
                      focusNode: negahban1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 25),
                        labelStyle: TextStyle(
                            color: negahban1.hasFocus
                                ? Color(0xffF35383)
                                : Colors.white,
                            fontSize: 20,
                            fontFamily: 'GM'),
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffF35383), width: 3)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 44, right: 44, bottom: 30),
                    child: TextField(
                      focusNode: negahban2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 25),
                        labelStyle: TextStyle(
                            color: negahban2.hasFocus
                                ? Color(0xffF35383)
                                : Colors.white,
                            fontSize: 20,
                            fontFamily: 'GM'),
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffF35383), width: 3)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 46,
                    width: 129,
                    child: ElevatedButton(
                      onPressed: () {
                        
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SwitchAccountScreen();
      },
    ));
                      },
                      child: Text('sign in'),
                      style: Theme.of(context).elevatedButtonTheme.style,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30,),
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
                ]),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    negahban1.dispose();
    negahban2.dispose();
    super.dispose();
  }
}
