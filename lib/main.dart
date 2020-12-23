import 'package:flutter/material.dart';
import 'package:my_class/ui/auth/auth_screen_set1.dart';
import 'package:my_class/ui/auth/auth_screen_set2.dart';

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
      home: AuthScreenSet1(),
      routes: {
        AuthScreenSet2.routeName: (ctx) => AuthScreenSet2(),
      },
    );
  }
}
