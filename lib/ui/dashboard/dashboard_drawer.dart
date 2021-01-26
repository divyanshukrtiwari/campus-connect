import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    if(isTeacher){
      final userdata = await FirebaseFirestore.instance
          .collection('teachers')
          .doc(user.uid)
          .get();
      setState(() {
        username = userdata['name'];
      });
    }else{
      final userdata = await FirebaseFirestore.instance
          .collection('students')
          .doc(user.uid)
          .get();
      setState(() {
        username = userdata['name'];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.teal.shade50,
        padding: EdgeInsets.only(
          top: 20,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Logged in as",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade100,
                  radius: 35,
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
              indent: 12,
              endIndent: 12,
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () => FirebaseAuth.instance.signOut(),
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
          ],
        ),
      ),
    );
  }
}
