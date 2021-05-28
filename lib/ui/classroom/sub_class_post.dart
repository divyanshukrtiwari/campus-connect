import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_class/helpers/db_helper.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;


class SubClassPost extends StatelessWidget {
  SubClassPost(this.subjectId, this.subject);
  final subjectId;
  final subject;

  @override
  Widget build(BuildContext context) {
    final subject_name = subject.toString().replaceAll(" ", "");

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(
              'classrooms/63KwnfX0AhsV33OnRHqG/seven_sem/KjSdQuVxbfX8Vk8XtR0P/syllabus/$subjectId/documents/')
          .orderBy('timeStamp', descending: true)
          .snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final doc = snapshot.data.documents;
        return ListView.builder(
          reverse: true,
          padding: EdgeInsets.all(12),
          itemCount: doc.length,
          itemBuilder: (context, index) {
            DBHelper.insert("ChatMessages", {
              'id':doc[index]['timeStamp'].toString(),
              'userId':doc[index]['userId'].toString(),
              'username':doc[index]['username'].toString(),
              'message':doc[index]['text'].toString(),
              'subjectName': subject_name,
            });
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints(minWidth: 150, maxWidth: 320),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      color: Colors.indigo[50],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doc[index]['username'],
                          maxLines: 7,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          doc[index]['text'],
                          maxLines: 7,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
