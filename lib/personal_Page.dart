// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/email.dart';

class personalPage extends StatelessWidget {
  final Email email;
  const personalPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          title: Row(
            children: [
              // CircleAvatar(
              //   backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
              //   child: Text(
              //     email.email![0].toUpperCase(),
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              Expanded(
                child: SizedBox(
                  width: 5,
                ),
              ),
              // Expanded(
              //   child: Text(
              //     'Sender',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              // ),
              SizedBox(
                width: 25,
              ),
              Icon(Icons.delete_outline_outlined),
              SizedBox(
                width: 20,
              ),
              Icon(CupertinoIcons.folder_badge_plus),
              SizedBox(
                width: 20,
              ),
              Icon(CupertinoIcons.ellipsis_vertical),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${email.subject}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.star,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('to me'),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${email.body}\n\n",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
