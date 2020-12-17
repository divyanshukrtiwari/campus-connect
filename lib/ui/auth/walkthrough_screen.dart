import 'package:flutter/material.dart';
import 'package:my_class/ui/auth/auth_form.dart';

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(),
    );
  }
}
