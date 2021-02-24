import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TakeAttendance extends StatefulWidget {
  static const routeName = '/take-attendance';

  @override
  _TakeAttendanceState createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends State<TakeAttendance> {

  List _students = [];

  List _filteredStudents = [];

  bool _sectionA = false;

  bool _sectionB = false;

  void getStudents() async {
    final studentData =
        await FirebaseFirestore.instance.collection('students').get();
    setState(() {
      _students = studentData.docs;
    });
  }

  void filter(String sec) {
    _filteredStudents.clear();
    _students.forEach((element) {
      if (element['section'].toString().toLowerCase() == sec) {
        _filteredStudents.add(element);
      }
    });

    setState(() {});
  }

  Future<void> _setAttendance(String uid, String subjectName) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('students/$uid/attendance');

    await reference.doc('subjects').set({});

    await FirebaseFirestore.instance
        .collection('students/$uid/attendance/subjects/$subjectName')
        .doc('daysPresent')
        .set(
            {
          'present': FieldValue.arrayUnion([Timestamp.now()])
        },
            SetOptions(
              merge: true,
            )).then(
      (something) => print('something happened'),
    );

    await reference.doc('total').update({
      "totalDays": FieldValue.increment(1),
    }).then((v) => print('Updated'));
  }

  @override
  void initState() {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue.shade200,
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color:
                                _sectionA ? Colors.blue.shade50 : Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _sectionA = !_sectionA;
                              });
                              filter('a');
                            },
                            child: Text(
                              "A",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.pink.shade200,
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color:
                                _sectionB ? Colors.pink.shade50 : Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _sectionB = !_sectionB;
                              });
                              filter('b');
                            },
                            child: Text(
                              "B",
                              style: TextStyle(fontSize: 20),
                            ),
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

                itemCount: _sectionA || _sectionB
                    ? _filteredStudents.length
                    : _students.length,
                itemBuilder: (ctx, index) => ListTile(
                  dense: true,
                  leading: Text(
                    _sectionA || _sectionB
                        ? _filteredStudents[index]['rollno']
                        : _students[index]['rollno'],
                    textAlign: TextAlign.center,
                  ),
                  title: Text(
                    _sectionA || _sectionB
                        ? _filteredStudents[index]['name']
                        : _students[index]['name'],
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlatButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: (){
                          _setAttendance(_students[index]['uid'], 'Cryptography');
                          // setState(() {
                          //   _students[index]['present'] == true;
                          // });

                        },
                        child: Text(
                          "P",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          print("absent");
                        },
                        child: Text(
                          "A",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.assignment_turned_in_outlined),
                  //   onPressed: () => _setAttendance(_students[index]['uid'], 'Cryptography'),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
