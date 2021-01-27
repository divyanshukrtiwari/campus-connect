import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_class/ui/classroom/take_attendance.dart';

class SubClassDrawer extends StatefulWidget {
  @override
  _SubClassDrawerState createState() => _SubClassDrawerState();
}

class _SubClassDrawerState extends State<SubClassDrawer> {
  bool _teacher = false;

  void _isteacher() async{
    final user = FirebaseAuth.instance.currentUser;
    final teacherData = await FirebaseFirestore.instance
        .collection('teachers')
        .doc(user.uid)
        .get();


    if(teacherData.exists){
      setState(() {
        _teacher = true;
      });
    }else{
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
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              "Subject Teachers",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(indent: 12, endIndent: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.pink.shade100,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Teacher 1",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade100,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Teacher 2",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(indent: 12, endIndent: 12),
          if (_teacher)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
              child: InkWell(
                child: Text(
                 "Take Attendance",
                  style: TextStyle(fontSize: 18),
                ),
                onTap:(){
                  Navigator.of(context).pushNamed(TakeAttendance.routeName);
                },
              ),
            ),

        ],
      ),
    );
  }
}
