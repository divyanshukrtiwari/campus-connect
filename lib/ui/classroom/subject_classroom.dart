import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectClassroom extends StatelessWidget {
  static const routeName = '/subject-classroom';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var data = ModalRoute.of(context).settings.arguments as Map;
    String title = data['subject'].toString();
    String subjectId = data['subjectId'];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: Colors.black.withOpacity(0.65), fontSize: 26),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                height: size.height * .4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue.shade50, Colors.blue.shade100]),
                    borderRadius: BorderRadius.circular(20)),
                child: null,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection(
                  'classrooms/63KwnfX0AhsV33OnRHqG/seven_sem/KjSdQuVxbfX8Vk8XtR0P/syllabus/$subjectId/documents/')
              .snapshots(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final doc = snapshot.data.documents;
            print(doc);
            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: doc.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.teal.shade50,
                      radius: 20,
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue[50]),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Text(
                            doc[index]['text'],
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
