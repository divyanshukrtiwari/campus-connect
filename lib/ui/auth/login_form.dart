import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:my_class/helpers/student.dart';
import 'package:my_class/ui/dashboard/dashboard_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form2Key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void _onSubmit() async {
      print("on submit called");
      UserCredential authResult;

      try {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: student['email'],
          password: student['password'],
        );

        await FirebaseFirestore.instance
            .collection('students')
            .doc(authResult.user.uid)
            .set(
          {
            'name': student['name'],
            'semester': student['semester'],
            'section': student['section'],
            'rollno': student['rollno'],
            'email': student['email'],
            'password': student['password'],
          },
        );
        Navigator.of(context).pushNamed(DashboardPage.routeName);
      } on PlatformException catch (error) {
        String message = 'Please check your credentials and try again';

        if (error.message != null) {
          message = error.message;
        }

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).errorColor,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
          ),
        );
      } catch (error) {
        print(error);
      }
    }

    return Container(
      child: Form(
        key: _form2Key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  //labelText: 'Email',
                  hintText: 'Email',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid ';
                  }
                  return null;
                },
                onSaved: (value) {
                  student['email'] = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  //labelText: 'Password',
                  hintText: 'Password',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                ),
                obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
                onSaved: (value) {
                  student['password'] = value;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                final isValid = _form2Key.currentState.validate();

                FocusScope.of(context).unfocus();

                if (isValid) {
                  _form2Key.currentState.save();
                }
                _onSubmit();
              },
              color: Colors.pink[100],
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
