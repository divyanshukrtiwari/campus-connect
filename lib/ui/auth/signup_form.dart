import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'package:my_class/helpers/student.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _form1Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form1Key,
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
                student['name'] = value;
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Semester',
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Invalid semester!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      student['semester'] = value;
                    },
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Section',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Invalid section!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      student['section'] = value;
                    },
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Roll Number',
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Invalid roll number!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      student['rollno'] = value;
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          RaisedButton(
            onPressed: () {
              final isValid = _form1Key.currentState.validate();

              FocusScope.of(context).unfocus();

              if (isValid) {
                _form1Key.currentState.save();
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
    );
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
