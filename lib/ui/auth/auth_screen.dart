import 'package:flutter/material.dart';
import 'package:my_class/ui/auth/auth_set1.dart';
import 'package:my_class/ui/auth/auth_set2.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: AuthSet1(),
          ),
        ),
      ),
    );
  }
}
