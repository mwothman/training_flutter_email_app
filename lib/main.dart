import 'package:flutter/material.dart';
import 'messages_page.dart';

void main() {
  runApp(const EmailApp());
}

class EmailApp extends StatelessWidget {
  const EmailApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Email App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MessagePage(title: 'messages'),
    );
  }
}
