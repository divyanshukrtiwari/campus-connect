import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_class/helpers/user_details.dart';

class DashboardDrawer extends StatefulWidget {
  @override
  _DashboardDrawerState createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  var username = '';

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    final user = FirebaseAuth.instance.currentUser;

    final teacherData = await FirebaseFirestore.instance
        .collection('teachers')
        .doc(user.uid)
        .get();

    final studentData = await FirebaseFirestore.instance
        .collection('students')
        .doc(user.uid)
        .get();

    if (teacherData.exists) {
      setState(() {
        username = teacherData['name'];
      });
    } else {
      setState(() {
        username = studentData['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:16.0,bottom:8.0),
              child: Text(
                "Logged in as",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Divider(
              indent: 8,
              endIndent: 12,
            ),
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.account_circle),
                  radius: 50,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    username,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Divider(
              indent: 8,
              endIndent: 12,
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () => FirebaseAuth.instance.signOut(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 16),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
