// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:email_app/message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  const MessageCompose({Key? key}) : super(key: key);

  @override
  State<MessageCompose> createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  @override

  // ignore: prefer_const_constructors

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose New Message'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: TextField(
                  decoration: InputDecoration(
                      labelText: 'To',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold))),
            ),
            Divider(),
            ListTile(
              title: TextField(
                  decoration: InputDecoration(
                      labelText: 'Subject',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold))),
            ),
            Divider(),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                    labelText: 'Body',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                maxLines: 5,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Message message = Message(subject: 'subject', body: 'body');

                Navigator.pop(context, message);
              },
              child: Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}
