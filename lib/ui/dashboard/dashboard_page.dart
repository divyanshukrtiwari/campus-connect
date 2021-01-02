import 'package:flutter/material.dart';
import 'package:my_class/ui/notices/notices_tab_home.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 110,
                bottom: 30,
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text.rich(
                    TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: ' to',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: '\nCampus',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' Connect',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  )),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1 / 1,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.teal[100],
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.school,
                          size: 50,
                        ),
                        Text('Classroom',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.teal[100],
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.assignment,
                          size: 50,
                        ),
                        Text('Quiz',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed(NoticesTabHome.routeName),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.teal[100],
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.event_note,
                            size: 50,
                          ),
                          Text(
                            'Notices',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.teal[100],
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.people_alt,
                          size: 50,
                        ),
                        Text('Attendance',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
