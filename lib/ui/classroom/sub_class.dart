import 'package:flutter/material.dart';

import 'package:my_class/helpers/user_details.dart';
import 'sub_class_post.dart';
import 'sub_class_new_post.dart';
import 'sub_class_drawer.dart';

class SubClass extends StatelessWidget {
  static const routeName = '/subject-classroom';
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments as Map;
    String title = data['subject'].toString();
    String subjectId = data['subjectId'];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: Colors.black.withOpacity(0.65), fontSize: 26),
        ),
      ),
      drawer: SubClassDrawer(
        subject: data['subject'].toString(),
        subjectId: data['subjectId'],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: SubClassPost(subjectId, title)),
            SubClassNewPost(subjectId),
          ],
        ),
      ),
    );
  }
}
