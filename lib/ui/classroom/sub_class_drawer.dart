import 'package:flutter/material.dart';

class SubClassDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
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
    );
  }
}
