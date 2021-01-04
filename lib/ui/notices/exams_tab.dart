import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExamsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              elevation: 2,
              backgroundColor: Colors.white,
              expandedHeight: size.height * .4,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // titlePadding: EdgeInsetsDirectional.only(top: 8.0),
                title: Text(
                  "Notices",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Hero(
                  tag: 'notice',
                  child: Image.asset(
                    'assets/images/Notify-amico.png',
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ];
        },
        body: StreamBuilder(
          stream: Firestore.instance
              .collection('notices/S9jF7cpouJ1C3gMYftqH/exam')
              .snapshots(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }

            final doc = snapShot.data.documents;
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: doc.length,
              itemBuilder: (context, index) => Card(
                color: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.teal.shade50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          doc[index]['title'],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(doc[index]['text']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Publised By"),
                                Text(doc[index]['published-by']),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Publised On"),
                                Text(
                                  doc[index]['published-on']
                                      .toDate()
                                      .toString()
                                      .split(" ")[0],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
