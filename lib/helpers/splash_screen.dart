import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Campus',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.withOpacity(0.7),
                  ),
                ),
                TextSpan(
                  text: ' Connect',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                    color: Colors.pink.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
