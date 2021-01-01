import 'package:flutter/material.dart';

import 'signup_form.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup-screen';
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
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
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
                    child: SignupForm(),
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
