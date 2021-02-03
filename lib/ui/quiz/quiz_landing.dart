import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_class/ui/classroom/sub_class.dart';

import 'start_screen.dart';

class QuizLanding extends StatelessWidget {
  static const routeName = "/quiz-landing";

  final Map<int, Map<String, Color>> colors = {
    0: {'start': Colors.teal.shade50, 'end': Colors.teal.shade50},
    1: {'start': Colors.blue.shade50, 'end': Colors.blue.shade200},
    2: {'start': Colors.indigo.shade50, 'end': Colors.indigo.shade200},
    3: {'start': Colors.pink.shade50, 'end': Colors.pink.shade200},
    4: {'start': Colors.purple.shade50, 'end': Colors.purple.shade200}
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              elevation: 0,
              backgroundColor: Colors.white,
              expandedHeight: size.height * .4,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(6.0),
                centerTitle: true,
                // titlePadding: EdgeInsetsDirectional.only(top: 8.0),
                title: Text(
                  "Quiz",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Hero(
                  tag: 'quiz',
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset(
                      'assets/images/Exams-amico.png',
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(
                  'classrooms/63KwnfX0AhsV33OnRHqG/seven_sem/KjSdQuVxbfX8Vk8XtR0P/syllabus')
              .snapshots(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final doc = snapShot.data.documents;

            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: doc.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(
                  //   SubClass.routeName,
                  //   arguments: {
                  //     'subject': doc[index]['subject'],
                  //     'subjectId': doc[index].documentID,
                  //   },
                  // );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartScreen(),
                      ));
                },
                child: Card(
                  color: colors[index]['start'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // gradient: LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [colors[index]['start'], colors[index]['end']],
                      // ),
                    ),
                    child: Stack(
                      children: [

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            doc[index]["subject"],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
