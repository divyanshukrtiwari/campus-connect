import "package:flutter/material.dart";

class Attendance extends StatefulWidget {
  static const routeName = '/attendance';
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
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
                  "Attendance",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Hero(
                  tag: 'Attendance',
                  child: Image.asset(
                    'assets/images/Nerd-amico.png',
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Text("Attendance data"),
          ],
        ),
      ),
    );
  }
}
