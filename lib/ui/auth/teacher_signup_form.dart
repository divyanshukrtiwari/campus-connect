import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:my_class/helpers/user_details.dart';

class TeacherSignupForm extends StatefulWidget {
  @override
  _TeacherSignupFormState createState() => _TeacherSignupFormState();
}

class _TeacherSignupFormState extends State<TeacherSignupForm> {
  final _form1AKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form1AKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your full name',
              ),
              enableSuggestions: true,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              validator: (value) {
                if (value.isEmpty || value.length < 4) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                teacher['name'] = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your access code',
              ),
              enableSuggestions: true,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              validator: (value) {
                if (value.isEmpty || value.length < 4) {
                  return 'Please enter your access code';
                }
                return null;
              },
              onSaved: (value) {
                teacher['access_code'] = value;
              },
            ),
          ),

          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              final isValid = _form1AKey.currentState.validate();

              FocusScope.of(context).unfocus();

              if (isValid) {
                _form1AKey.currentState.save();
                Navigator.of(context).push(_createRoute());
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Text(
              "Next",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Colors.pink[100],
          )
        ],
      ),
    );;
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(true),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.fastOutSlowIn;

      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 600),
  );
  //custom route
}

