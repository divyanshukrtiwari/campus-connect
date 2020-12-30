import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExamsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: StreamBuilder(
        stream: Firestore.instance.collection('exam-notices').snapshots(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final doc = snapShot.data.documents;
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: doc.length,
            itemBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                title: Text(doc[index]['title']),
                subtitle: Text(
                  doc[index]['text'],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
