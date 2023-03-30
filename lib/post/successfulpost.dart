import 'package:flutter/material.dart';
import 'package:utool/homepage/homepage.dart';

class SuccessfulPost extends StatefulWidget {
  const SuccessfulPost({Key? key}) : super(key: key);

  @override
  _SuccessfulPost createState() => _SuccessfulPost();
}

class _SuccessfulPost extends State<SuccessfulPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('uTool'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const Text(
            'Good job !',
            style: TextStyle(fontSize: 28, color: Colors.red),
          ),

          const Text(
            'Your tool already posted',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),

          //add a empty line
          const Text(
            ' ',
          ),

          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: const Text(
                'Back to home page',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
