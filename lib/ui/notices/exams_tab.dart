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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      doc[index]["title"],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      doc[index]["text"],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Published By",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              "CSE HOD",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                         Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Published On",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              "20 Dec 2020",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
