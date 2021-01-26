import 'package:flutter/material.dart';

import 'signup_form.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup-screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isTeacher = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/topBorder.png",
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/bottomBorder.png",
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Get',
                      style: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: ' Started by',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\nSigning',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' Up',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/Personal site-amico.png",
                    height: height * .45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: isTeacher ? Container() :SignupForm(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Student",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      Switch(
                        activeColor: Colors.blue,
                        value: isTeacher,
                        onChanged: (value) {
                          if (isTeacher) {
                            isTeacher = false;
                          } else {
                            isTeacher = true;
                          }
                          setState(() {});
                        },
                      ),
                      Text(
                        'Teacher',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
