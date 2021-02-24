import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_class/helpers/user_details.dart';
import 'package:my_class/ui/attendance/attendance.dart';
import 'package:my_class/ui/classroom/classroom.dart';
import 'package:my_class/ui/notices/notices_tab_home.dart';
import 'package:my_class/ui/quiz/quiz_landing.dart';

import 'dashboard_drawer.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _teacher = false;

  void _isteacher() async {
    final user = FirebaseAuth.instance.currentUser;
    final teacherData = await FirebaseFirestore.instance
        .collection('teachers')
        .doc(user.uid)
        .get();

    if (teacherData.exists) {
      setState(() {
        _teacher = true;
      });
    } else {
      setState(() {
        _teacher = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isteacher();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        toolbarHeight: 60,
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Campus',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              TextSpan(
                text: ' Connect',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DashboardDrawer(),
      body: Column(
        children: [
          SizedBox(height: 15),
          Expanded(
            flex: 3,
            child: Image.asset('assets/images/Teacher-cuate.png'),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: _teacher ? 3 : 4,
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.symmetric(
                  horizontal: height * .055, vertical: height * .03),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1 / 1,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Classroom.routeName);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 1,
                    child: Hero(
                      tag: 'class',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.indigo.shade50,
                              Colors.indigo.shade100
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                "assets/images/Teaching.png",
                                height: 110,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Classroom',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(NoticesTabHome.routeName),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 1,
                    child: Hero(
                      tag: 'notice',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.teal.shade50, Colors.teal.shade100],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                "assets/images/Notify-amico.png",
                                width: 110,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Notice',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                _teacher
                    ? SizedBox()
                    : InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(QuizLanding.routeName),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 1,
                          child: Hero(
                            tag: 'quiz',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pink.shade50,
                                    Colors.pink.shade100
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      "assets/images/Exams-amico.png",
                                      width: 100,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        'Quiz',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                _teacher
                    ? SizedBox()
                    : InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(Attendance.routeName),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 1,
                          child: Hero(
                            tag: "Attendance",
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blue.shade50,
                                    Colors.blue.shade100
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      "assets/images/Nerd-amico.png",
                                      width: 110,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        'Attendance',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
