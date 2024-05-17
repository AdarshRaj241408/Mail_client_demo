import 'package:flutter/material.dart';
import 'models/email.dart';

class personalPage extends StatelessWidget {
  final Email email;
  const personalPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('From: ${email.userName}'),
            Text('Subject: ${email.subject}'),
            Text('Body: ${email.body}'),
            Text('Date: ${email.dateTime}'),
          ],
        ),
      ),
    );
  }
}
