import 'package:flutter/material.dart';

import 'auth_set2.dart';

class AuthSet1 extends StatefulWidget {
  @override
  _AuthSet1State createState() => _AuthSet1State();
}

class _AuthSet1State extends State<AuthSet1> {
  final _formKey = GlobalKey<FormState>();

  Map<String, String> _authDataSet1 = {
    'name': '',
    'sem': '',
    'sec': '',
    'rollno': '',
  };
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                _authDataSet1['name'] = value;
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
                      _authDataSet1['semester'] = value;
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
                      _authDataSet1['section'] = value;
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
                    },
                    onSaved: (value) {
                      _authDataSet1['rollno'] = value;
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
              final isValid = _formKey.currentState.validate();

              FocusScope.of(context).unfocus();

              if (isValid) {
                Navigator.of(context).pushNamed(AuthSet2.routeName, arguments: [
                _authDataSet1['name'],
                _authDataSet1['semester'],
                _authDataSet1['section'],
                _authDataSet1['rollno'],
              ]);
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}
