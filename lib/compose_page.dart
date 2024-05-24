// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComposePage extends StatefulWidget {
  const ComposePage({super.key});

  @override
  State<ComposePage> createState() => _ComposePageState();
}

class _ComposePageState extends State<ComposePage> {
  final _compController = TextEditingController();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _subController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          actions: [
            Icon(CupertinoIcons.paperclip),
            SizedBox(width: 18),
            IconButton(onPressed: () {}, icon: Icon(Icons.send)),
            SizedBox(width: 10),
            Icon(CupertinoIcons.ellipsis_vertical),
            SizedBox(width: 15),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text(
                          "From",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(3.0),
                            child: TextFormField(
                              controller: _fromController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Your email",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text(
                          "To",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            // padding: EdgeInsets.all(3.0),
                            child: TextFormField(
                              controller: _toController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                // hintText: "Your email",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            // padding: EdgeInsets.all(3.0),
                            child: TextFormField(
                              controller: _subController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Subject",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Container(
                          height: 500,
                          width: double.infinity,
                          child: TextFormField(
                            controller: _compController,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Compose Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey[400], fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
