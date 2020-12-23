import 'package:flutter/material.dart';
import 'package:my_class/ui/auth/auth_set1.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              width: height * .35,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/bottomBorder.png",
              height: height * .3,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/AddUser.png",
                    height: height * .4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: AuthSet1(),
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
