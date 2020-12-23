import 'package:flutter/material.dart';

import 'auth_screen_set2.dart';
import 'package:my_class/helpers/student.dart';

class AuthFormSet1 extends StatefulWidget {
  @override
  _AuthSet1State createState() => _AuthSet1State();
}

class _AuthSet1State extends State<AuthFormSet1> {
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
              style: TextStyle(
                color: Theme.of(context).primaryColor,
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
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
                Navigator.of(context).pushNamed(
                  AuthScreenSet2.routeName,
                );
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Text("Next"),
            color: Colors.pink[100],
          )
        ],
      ),
    );
  }
}
