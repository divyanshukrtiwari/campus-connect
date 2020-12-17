import 'package:flutter/material.dart';

class AuthSet2 extends StatefulWidget {
  static const routeName = 'AuthSet2';
  @override
  _AuthSet2State createState() => _AuthSet2State();
}

class _AuthSet2State extends State<AuthSet2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid ';
                      }
                    },
                    onSaved: (value) {
                      //_authData['username'] = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      //labelText: 'Password',
                      hintText: 'Password',
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid password';
                      }
                    },
                    onSaved: (value) {
                      //_authData['username'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Submit"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
