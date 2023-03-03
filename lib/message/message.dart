import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  MessagePage createState() => MessagePage();
}

class MessagePage extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: const Text('There is messages here'),
      //It should connect to message system. Have no idea yet.
    );
  }
}
