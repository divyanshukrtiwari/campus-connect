import 'package:flutter/material.dart';
import 'package:my_class/ui/auth/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/main_top.png",
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'User',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
                      children: [
                        // TextSpan(
                        //   text: ' to',
                        //   style: TextStyle(
                        //       fontSize: 36, fontWeight: FontWeight.normal),
                        // ),
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        // TextSpan(
                        //   text: ' Connect',
                        //   style: TextStyle(
                        //       fontSize: 36, fontWeight: FontWeight.normal),
                        // ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/My password-amico.png",
                    height: height * .5,
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
