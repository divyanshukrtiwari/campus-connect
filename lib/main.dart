import 'package:flutter/material.dart';
import 'package:my_class/ui/auth/auth_screen.dart';
import 'package:my_class/ui/auth/auth_set2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
      routes: {
        AuthSet2.routeName: (ctx) => AuthSet2(),
      },
    );
  }
}
