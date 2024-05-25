// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail_login/main.dart';
import 'models/email.dart';
import 'models/email_widgets.dart';
import 'personal_Page.dart';
import 'compose_page.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  // late TabController tabController;
  // List<EmailTab> tabs = [
  //   EmailTab("Inbox", Icons.inbox_outlined),
  //   EmailTab("Sent", Icons.send_outlined),
  //   EmailTab("Star", Icons.star_outlined),
  // ];

  List<Email> emails = [
    Email(
        '', //profileImage
        'Codeforces', //userName
        "Codeforces Round 945 (Div. 2)", //subject:
        "Hello, 24012210.Welcome to the regular Codeforces round....", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'JetBrains Account ', //userName
        "Develop smarter with JetBrains", //subject:
        "Hello Adarsh,Thank you for choosing JetBrains development tools!..", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Github', //userName
        "Please download your two-factor", //subject:
        "Hey AdarshRaj241408!You’ve just enabled two-factor authentication..", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Spotify', //userName
        "Fall asleep to these soothing", //subject:
        "Hi Adarsh, Our sleep timer automatically turns off your audio.", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Vercel', //userName
        "Failed production deployment", //subject:
        "Adarsh Raj (AdarshRaj241408) for leetcodeboard, via GitHub", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Spotify', //userName
        "New login to Spotify", //subject:
        "Hi Nikki, We noticed you logged in from a new device.", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Github', //userName
        "Please download your two-factor", //subject:
        "Hey AdarshRaj241408!You’ve just enabled two-factor authentication..", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Spotify', //userName
        "Fall asleep to these soothing", //subject:
        "Hi Adarsh, Our sleep timer automatically turns off your audio.", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Vercel', //userName
        "Failed production deployment", //subject:
        "Adarsh Raj (AdarshRaj241408) for leetcodeboard, via GitHub", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
    Email(
        '', //profileImage
        'Spotify', //userName
        "New login to Spotify", //subject:
        "Hi Nikki, We noticed you logged in from a new device.", //body:
        DateTime.now().subtract(const Duration(hours: 3))),
  ];

  // @override
  // void initState() {
  //   tabController = TabController(length: 3, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: 100,
                color: const Color.fromRGBO(143, 148, 251, 1),
                child: Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                )),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.mail_outline),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Inbox'),
                ],
              ),
              onTap: () {
                // Implement action for menu item 1
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.star_border),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Starred'),
                ],
              ),
              onTap: () {
                // Implement action for menu item 1
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Snoozed'),
                ],
              ),
              onTap: () {
                // Implement action for menu item 1
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.send_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Sent'),
                ],
              ),
              onTap: () {
                // Implement action for menu item 1
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.file_copy),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Drafts'),
                ],
              ),
              onTap: () {
                // Implement action for menu item 1
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.keyboard_arrow_down_rounded),
                  SizedBox(
                    width: 20,
                  ),
                  Text('More'),
                ],
              ),
              onTap: () {
                // Implement action for menu item 1
              },
            ),
            ListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 130,
                color: const Color.fromRGBO(143, 148, 251, 1),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Builder(builder: (context) {
                        return Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.search, color: Colors.grey),
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              personalPage(email: emails[index]),
                        ),
                      );
                    },
                    child: EmailWidget(email: emails[index]),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: emails.length,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComposePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 10,
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
              ),
              child: Icon(
                CupertinoIcons.pen,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
