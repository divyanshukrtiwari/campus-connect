import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_class/ui/classroom/classroom.dart';
import 'package:my_class/ui/classroom/subject_classroom.dart';
import 'package:my_class/ui/dashboard/dashboard_page.dart';
import 'package:my_class/ui/auth/auth_screen_set1.dart';
import 'package:my_class/ui/auth/auth_screen_set2.dart';
import 'package:my_class/ui/notices/notices_tab_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: TextTheme(
                bodyText2: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.65),
                ),
              ),
            ),
            home: DashboardPage(),
            routes: {
              AuthScreenSet2.routeName: (ctx) => AuthScreenSet2(),
              NoticesTabHome.routeName: (ctx) => NoticesTabHome(),
              DashboardPage.routeName: (ctx) => DashboardPage(),
              Classroom.routeName: (ctx) => Classroom(),
              SubjectClassroom.routeName: (ctx) => SubjectClassroom(),
            },
          );
        }
      },
    );
  }
}
