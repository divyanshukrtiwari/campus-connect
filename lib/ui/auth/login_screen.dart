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
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/images/main_bottom.png",
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/Login-amico.png",
                    height: height * .45,
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
