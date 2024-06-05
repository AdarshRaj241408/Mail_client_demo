import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mail_login/second_page.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:mail_login/logger.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> validateAndLogin({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  required Function({
    String? usernameError,
    String? passwordError,
    String? loginError,
  }) setErrorMessages,
}) async {
  setErrorMessages(
    usernameError:
        usernameController.text.isEmpty ? 'Please enter the username' : null,
    passwordError:
        passwordController.text.isEmpty ? 'Please enter the password' : null,
    loginError: null,
  );

  if (formKey.currentState!.validate()) {
    final username = usernameController.text;
    final password = passwordController.text;

    final success = await authenticate(username, password);

    if (success) {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    } else {
      setErrorMessages(
        usernameError: null,
        passwordError: null,
        loginError: 'Incorrect username or password, please try again',
      );
    }
  }
}

Future<bool> authenticate(String username, String password) async {
  final client = ImapClient(isLogEnabled: true);

  try {
    await client
        .connectToServer('newmailhost.cc.iitk.ac.in', 993, isSecure: true)
        .timeout(const Duration(seconds: 30));
    await client.login(username, password);
    await client.logout();
    return true; // Authentication successful
  } on ImapException catch (e) {
    defaultLogger.e('IMAP failed with $e');
    return false; // Authentication failed
  } catch (e) {
    if (e is TimeoutException) {
      defaultLogger.e('Connection to IMAP server timed out: $e');
    } else {
      defaultLogger.e('Unexpected error: $e');
    }
    return false; // Other errors or timeout
  }
}
