import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:firebase/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Helpers/Mixins/TextFieldMixin.dart';
import 'ChatScreenVM.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, this.data});
  final data;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  //String name = "";

  late final ChatScreenVM _chatScreenVM = ChatScreenVM(widget.data);

  final _messageController = TextEditingController();

  //final List<String> searchedItems = [];

  @override
  void initState() {
    _chatScreenVM.nameFieldController.stream.listen((event) {
      if (event is AddText) {
        switch (event.data[1]) {
          case ("chat"):
            _messageController.text = _chatScreenVM.chatMessage;
            _messageController.selection = TextSelection.collapsed(
                offset: _chatScreenVM.chatMessage.length);
            break;
        }
      }
    });

    _chatScreenVM.navigationStream.stream.listen((event) {
      if (event is NavigatorPop) {
        // Invoke the pop() by context.pop
        context.pop();
      }
    });
  }


  // send message method
  void onSendMessage() async {
    if (_chatScreenVM.chatMessage.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser!.displayName,
        "message": _chatScreenVM.chatMessage,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _messageController.clear();

      await _firestore
          .collection('chatroom')
          .doc(_chatScreenVM.chatRoomId)
          .collection('chats')
          .add(messages);
      print("message stored");
    } else {
      print("Enter Some Text");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            _chatScreenVM.navigatetoSearchScreen();
          },
          child: Icon(Icons.arrow_back_outlined),
        ),
        title: Row(
          children: [
            const Icon(Icons.account_circle),
            const SizedBox(
              width: 15,
            ),
            Text(_chatScreenVM.userMap["username"]),
          ],
        ),
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('chatroom')
                    .doc(_chatScreenVM.chatRoomId)
                    .collection('chats')
                    .orderBy("time", descending: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      reverse: false,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> messagemap =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                        print(messagemap);
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(
                            alignment: messagemap["sendby"] ==
                                    _auth.currentUser!.displayName
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: messagemap["sendby"] ==
                                    _auth.currentUser!.displayName? Color(0xFF1b79f3) : Color(0xFF0742a0),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                messagemap['message'],
                                style: TextStyle(color:
                                 Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _chatScreenVM.getChatText(value);
                    },
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    onSendMessage();
                    // setState(() {
                    //   searchedItems.add(_messageController.text);
                    //   _messageController.clear();
                    // });
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
