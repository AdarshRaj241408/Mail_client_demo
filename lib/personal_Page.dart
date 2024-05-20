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
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                child: Text(
                  email.userName![0].toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  '${email.userName}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.delete_outline_outlined),
              SizedBox(
                width: 12,
              ),
              Icon(CupertinoIcons.folder_badge_plus),
              SizedBox(
                width: 12,
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
                        "${email.body}\n\n"
                        " Joel Fagliano, our senior editor, has been making the Mini crossword for almost 10 years. The Mini is a 5x5 crossword, as opposed to our daily puzzles that have a 15x15 grid. During Joel’s paternity leave in 2022, the other editors filled in, each making a couple weeks’ worth of puzzles, but he jumped back in as soon as he returned to work. Now, with our head editor, Will Shortz, recovering from a stroke, Joel has been filling in as the editor for the daily crossword. For the time being, that means that Tracy Bennett, Wyna Liu and I have been helping Joel out on the Mini-making front. The four of us are each making a week of puzzles every fourth week, with Sam Ezersky filling in as editor.\n\n"
                        "I am familiar with making Minis, but after just a couple of weeks of creating the daily Mini, I have a deeper respect for Joel’s job. The puzzles are made with beginner solvers in mind, so they have to be free of tough vocabulary and “crosswordese.” The words are all three to five letters long, except for the Saturday puzzle, which has a 7x7 grid. On top of those constraints, the puzzles should feel fun and fresh. As you might imagine, it’s tough to create an original grid using only real, familiar and short words that cross, all while trying to make the puzzles feel original and interesting. The idea of doing this every day for nearly 10 years boggles my mind.\n\n"
                        "Each puzzle I make starts with a seed. The seed could be a general concept (like an eclipse theme), a name of someone I’d like to highlight (like Diana NYAD) or a clue that I think would be fun (like using “Beat it!” to clue both SCAT and EGG). In my first Mini, published in 2022, I used the names of both of my children, WALLY and LEONA. Last month, my dad also had a stroke, and I spent some time working from the hospital as he recovered. He has always been a Bob Dylan superfan, so I made a Mini that crossed DAD with DYLAN. I let him pick which Dylan song to use in the clue, and I was relieved when he picked a familiar tune and not a deep cut. When I insert a personal reference into one of my puzzles, my goal is that the rest can be solved with ease, and that no one will be the wiser.",
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
