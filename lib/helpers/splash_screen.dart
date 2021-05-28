import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _platform = Platform.isAndroid ;
  @override
  void initState() {
    super.initState();
    //storeAssetsLocally();
    getImageFileFromAssets('images/Teacher-cuate.png');
    getImageFileFromAssets('images/Teaching.png');
    getImageFileFromAssets('images/Mobile login-pana.png');
    getImageFileFromAssets('images/My password-amico.png');
    getImageFileFromAssets('images/Exams-amico.png');
    getImageFileFromAssets('images/Notify-amico.png');
  }


  Future<File> getImageFileFromAssets(String path) async {

    final byteData = await rootBundle.load('assets/$path');

    final file =
    await File('${(await getExternalStorageDirectory()).path}/Illustrations/$path')
        .create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/Online world-pana.png',
                  height: 150,
                ),
              ),
              Text.rich(
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
            ],
          ),
        ),
      ),
    );
  }
}
