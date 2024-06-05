// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import 'package:mail_login/logger.dart';
import 'package:mail_login/models/email.dart';
import 'package:intl/intl.dart';
import 'package:mail_login/personal_Page.dart';
import 'enough_mail.dart';

class DisplayMail extends StatefulWidget {
  const DisplayMail({super.key});

  @override
  State<DisplayMail> createState() => _DisplayMailState();
}

class _DisplayMailState extends State<DisplayMail> {
  List<Email> emails = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    getmail();
  }

  Future<void> getmail() async {
    //connect to enough_mail.dart and call imapExample function to get the mails.
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final fetchedEmails = await imapExample();
      setState(() {
        emails = fetchedEmails;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load emails: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage.isNotEmpty
              ? const Center(
                  child: Text('No emails to display.'),
                )
              : ListView.separated(
                  itemCount: emails.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black12,
                  ),
                  itemBuilder: (context, index) {
                    final email = emails[index];
                    String formattedDate =
                        DateFormat('kk:mm').format(email.dateTime!);
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                        child: Text(
                          email.email![0].toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(child: Text(email.email!)),
                          Text(
                            formattedDate,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(email.subject!),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => personalPage(email: email),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
