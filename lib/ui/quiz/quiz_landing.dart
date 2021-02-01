import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_class/ui/classroom/sub_class.dart';

import 'start_screen.dart';

class QuizLanding extends StatelessWidget {
  static const routeName = "/quiz-landing";

  final Map<int, Map<String, Color>> colors = {
    0: {'start': Colors.teal.shade100, 'end': Colors.teal.shade200},
    1: {'start': Colors.blue.shade100, 'end': Colors.blue.shade200},
    2: {'start': Colors.indigo.shade100, 'end': Colors.indigo.shade200},
    3: {'start': Colors.pink.shade100, 'end': Colors.pink.shade200},
    4: {'start': Colors.purple.shade100, 'end': Colors.purple.shade200}
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
              elevation: 1,
              backgroundColor: Colors.white,
              expandedHeight: size.height * .4,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
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
                  child: Image.asset(
                    'assets/images/Exams-bro(2).png',
                    alignment: Alignment.center,
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
                  color: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    height: size.height * .17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [colors[index]['start'], colors[index]['end']],
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Positioned(
                        //    right: 20,
                        //    bottom: 20,
                        //     child: Image.asset('')
                        //  ),
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