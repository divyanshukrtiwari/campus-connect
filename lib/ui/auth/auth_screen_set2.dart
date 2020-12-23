import 'package:flutter/material.dart';
import 'package:my_class/ui/auth/auth_form_set2.dart';

class AuthScreenSet2 extends StatefulWidget {
  static const routeName = 'AuthScreenSet2';
  @override
  _AuthSet2State createState() => _AuthSet2State();
}

class _AuthSet2State extends State<AuthScreenSet2> {
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
                  AuthFormSet2(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
