// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  const EmailWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
        child: Text(
          email.userName![0].toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        email.userName!,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            email.subject!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            email.body!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      trailing: Column(
        children: [Text(GetTimeAgo.parse(email.dateTime!))],
      ),
    );
  }
}
