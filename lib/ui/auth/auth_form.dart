import 'package:flutter/material.dart';

enum AuthQueSet { Set1, Set2 }

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  AuthQueSet authQueSet = AuthQueSet.Set1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.pink[50],
              child: Form(
                child: authQueSet == AuthQueSet.Set1
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                //labelText: 'Enter your Name',
                                hintText: 'Enter your name',
                                // border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(30),
                                // ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              textAlign: TextAlign.center,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your name';
                                }
                              },
                              onSaved: (value) {
                                //_authData['username'] = value;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      //labelText: 'Semester',
                                      hintText: 'Semester',
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(30),
                                      // ),
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Invalid username!';
                                      }
                                    },
                                    onSaved: (value) {
                                      //_authData['username'] = value;
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      //labelText: 'Section',
                                      hintText: 'Section',
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(30),
                                      // ),
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Invalid username!';
                                      }
                                    },
                                    onSaved: (value) {
                                      //_authData['username'] = value;
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      //labelText: 'Roll Number',
                                      hintText: 'Roll Number',
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(30),
                                      // ),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Invalid username!';
                                      }
                                    },
                                    onSaved: (value) {
                                      //_authData['username'] = value;
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
                              setState(() {
                                authQueSet = AuthQueSet.Set2;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Text(
                              "Next",
                              // style: TextStyle(
                              //   fontSize: 18,
                              // ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
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
                                  color: Theme.of(context).primaryColor),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
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
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
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
          ],
        ),
      ),
    );
  }
}
