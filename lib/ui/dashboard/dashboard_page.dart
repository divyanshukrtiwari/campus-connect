import 'package:flutter/material.dart';
import 'package:my_class/ui/classroom/classroom.dart';
import 'package:my_class/ui/notices/notices_tab_home.dart';
import 'dashboard_drawer.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = '/dashboard';
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
          SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/Learning-amico.png',
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.symmetric(horizontal: height*.055, vertical: height*.03),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.15 / 1,
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
                                "assets/images/Classroom-cuate(1).png",
                                width: 130,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  'Classroom',
                                  style: TextStyle(
                                    fontSize: 20,
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
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pink.shade50, Colors.pink.shade100],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            "assets/images/Exams-bro(2).png",
                            width: 120,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              'Quiz',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  'Notice',
                                  style: TextStyle(
                                    fontSize: 20,
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
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue.shade50, Colors.blue.shade100],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            "assets/images/cls-ar.png",
                            width: 120,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              'Attendance',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
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
