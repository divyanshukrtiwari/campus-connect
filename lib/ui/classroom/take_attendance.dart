import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TakeAttendance extends StatefulWidget {
  static const routeName = '/take-attendance';

  @override
  _TakeAttendanceState createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends State<TakeAttendance> {
  List _students = [];

  void getStudents() async {
    final studentData =
        await FirebaseFirestore.instance.collection('students').get();
    setState(() {
      _students = studentData.docs;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Attendance',
          style: TextStyle(color: Colors.black.withOpacity(0.65), fontSize: 26),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose Section",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue.shade100),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "A",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.pink.shade100),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "B",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              height: 500,
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: Text(_students[index]['rollno']),
                  title: Text(_students[index]['name'],style: TextStyle(fontSize: 18),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
