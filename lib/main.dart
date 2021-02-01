import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_class/helpers/splash_screen.dart';
import 'package:my_class/ui/classroom/classroom.dart';
import 'package:my_class/ui/classroom/sub_class.dart';
import 'package:my_class/ui/classroom/take_attendance.dart';
import 'package:my_class/ui/dashboard/dashboard_page.dart';
import 'package:my_class/ui/auth/signup_screen.dart';
import 'package:my_class/ui/auth/login_screen.dart';
import 'package:my_class/ui/notices/notices_tab_home.dart';
import 'package:my_class/ui/quiz/quiz_landing.dart';

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
          return SplashScreen();
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
              bodyText2: GoogleFonts.poppins(
                color: Colors.black.withOpacity(0.65),
              ),
            ),
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SplashScreen();
              }
              if (snapshot.hasData) {
                return DashboardPage();
              }
              return LoginScreen(false);
            },
          ),
          routes: {
            SignupScreen.routeName: (ctx) => SignupScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(false),
            NoticesTabHome.routeName: (ctx) => NoticesTabHome(),
            DashboardPage.routeName: (ctx) => DashboardPage(),
            Classroom.routeName: (ctx) => Classroom(),
            SubClass.routeName: (ctx) => SubClass(),
            TakeAttendance.routeName: (ctx) => TakeAttendance(),
            QuizLanding.routeName: (ctx) => QuizLanding(),
          },
        );
      },
    );
  }
}
