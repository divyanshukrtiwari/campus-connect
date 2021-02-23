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

  final textFieldFocusNode = FocusNode();

  var enteredMsg = '';

  bool _teacher = false;

  bool popUp = false;

  @override
  void initState() {
    super.initState();
    _isteacher();
  }

  void _isteacher() async{
    final user = FirebaseAuth.instance.currentUser;
    final teacherData = await FirebaseFirestore.instance
        .collection('teachers')
        .doc(user.uid)
        .get();


    if(teacherData.exists){
      setState(() {
        _teacher = true;
      });
    }
  }

  void _sendMsg() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final teacherData = await FirebaseFirestore.instance
        .collection('teachers')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance
        .collection(
            'classrooms/63KwnfX0AhsV33OnRHqG/seven_sem/KjSdQuVxbfX8Vk8XtR0P/syllabus/${widget.subjectId}/documents')
        .add({
      'text': enteredMsg,
      'timeStamp': Timestamp.now(),
      'userId': user.uid,
      'username': teacherData['name'],
    });
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _teacher ? Container(
      height: popUp ? 220 : 75,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          popUp
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.image,
                                  size: 35,
                                ),
                                color: Colors.blue.shade500,
                                onPressed: () {},
                              ),
                            ),
                            Text(
                              'Image',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.picture_as_pdf,
                                  size: 35,
                                ),
                                color: Colors.blue.shade500,
                                onPressed: () {},
                              ),
                            ),
                            Text(
                              'Document',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(
                ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: true,
                  focusNode: textFieldFocusNode,
                  enableSuggestions: true,
                  controller: _controller,
                  decoration: InputDecoration(
                    isDense: true,
                    suffixIcon: GestureDetector(
                      child: Icon(
                        Icons.attach_file,
                        size: 25,
                      ),
                      onTap: () {
                        if (!textFieldFocusNode.hasFocus)
                          //textFieldFocusNode.unfocus();

                          textFieldFocusNode.canRequestFocus = false;

                        setState(() {
                          if (popUp) {
                            popUp = false;
                          } else {
                            popUp = true;
                          }
                        });

                        Future.delayed(Duration(milliseconds: 100), () {
                          textFieldFocusNode.canRequestFocus = true;
                        });
                      },
                    ),
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
        ],
      ),
    ): SizedBox();
  }
}
