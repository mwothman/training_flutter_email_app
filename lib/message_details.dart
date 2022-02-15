import 'package:flutter/material.dart';

class MessageDetailsPage extends StatelessWidget {
  const MessageDetailsPage({
    Key? key,
    required this.subject,
    required this.body,
  }) : super(key: key);

  final String subject;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Center(child: Text(body)),
    );
  }
}
