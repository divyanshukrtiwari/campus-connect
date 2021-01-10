import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_class/ui/classroom/subject_classroom.dart';

class Classroom extends StatelessWidget {
  static const routeName = "/classroom";

  final Map<int, Map<String, Color>> colors = {
    0: {'start': Colors.teal.shade50, 'end': Colors.teal.shade100},
    1: {'start': Colors.blue.shade50, 'end': Colors.blue.shade100},
    2: {'start': Colors.indigo.shade50, 'end': Colors.indigo.shade100},
    3: {'start': Colors.pink.shade50, 'end': Colors.pink.shade100},
    4: {'start': Colors.purple.shade50, 'end': Colors.purple.shade100}
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
              elevation: 2,
              backgroundColor: Colors.white,
              expandedHeight: size.height * .4,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // titlePadding: EdgeInsetsDirectional.only(top: 8.0),
                title: Text(
                  "Classrooms",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Hero(
                  tag: 'class',
                  child: Image.asset(
                    'assets/images/Classroom-cuate(1).png',
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
                  Navigator.of(context).pushNamed(
                    SubjectClassroom.routeName,
                    arguments: {
                      'subject': doc[index]['subject'],
                      'subjectId': doc[index].documentID,
                    },
                  );
                },
                child: Card(
                  color: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    height: size.height * .15,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/cloud-computing.jpg'),
                      //   fit: BoxFit.cover,
                      //   colorFilter: ColorFilter.mode(
                      //     Colors.transparent.withOpacity(.07),
                      //     BlendMode.dstATop,
                      //   ),
                      // ),
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [colors[index]['start'], colors[index]['end']],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        doc[index]["subject"],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
