import 'package:flutter/material.dart';
//import 'package:mail_login/logger.dart';
import 'package:mail_login/models/email.dart';
import 'package:intl/intl.dart';
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

  Future<void> getmail() async {
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
      appBar: AppBar(
        title: const Text(
          'Fetch Mail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        actions: [
          SizedBox(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: getmail,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Get Mail',
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
        ],
      ),
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
                      onTap: () {},
                    );
                  },
                ),
    );
  }
}
