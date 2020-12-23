import 'package:flutter/material.dart';

class AuthFormSet2 extends StatefulWidget {
  @override
  _AuthFormSet2State createState() => _AuthFormSet2State();
}

class _AuthFormSet2State extends State<AuthFormSet2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
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
                style: TextStyle(color: Theme.of(context).primaryColor),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid ';
                  }
                  return null;
                },
                onSaved: (value) {
                  //_authData['username'] = value;
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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Theme.of(context).primaryColor),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
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
