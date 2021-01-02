import 'package:flutter/material.dart';
import 'package:my_class/ui/dashboard/dashboard_page.dart';
import 'package:my_class/ui/auth/auth_screen_set1.dart';
import 'package:my_class/ui/auth/auth_screen_set2.dart';
import 'package:my_class/ui/notices/notices_tab_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardPage(),
      routes: {
        AuthScreenSet2.routeName: (ctx) => AuthScreenSet2(),
        NoticesTabHome.routeName: (ctx) => NoticesTabHome(),
        DashboardPage.routeName: (ctx) => DashboardPage(),
      },
    );
  }
}
