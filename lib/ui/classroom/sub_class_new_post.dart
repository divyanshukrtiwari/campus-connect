import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubClassNewPost extends StatefulWidget {
  SubClassNewPost(this.subjectId);
  final subjectId;
  @override
  _SubClassNewPostState createState() => _SubClassNewPostState();
}

class _SubClassNewPostState extends State<SubClassNewPost> {
  final _controller = TextEditingController();

  var enteredMsg = '';

  void _sendMsg() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('students')
        .doc(user.uid)
        .get();
    FirebaseFirestore.instance
        .collection(
            'classrooms/63KwnfX0AhsV33OnRHqG/seven_sem/KjSdQuVxbfX8Vk8XtR0P/syllabus/${widget.subjectId}/documents')
        .add({
      'text': enteredMsg,
      'timeStamp': Timestamp.now(),
      'userId': user.uid,
      'username': userData['name'],
    });
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.grey.shade100,
                labelText: 'enter message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  enteredMsg = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: enteredMsg.trim().isEmpty ? null : _sendMsg,
          )
        ],
      ),
    );
  }
}
