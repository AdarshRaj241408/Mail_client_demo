// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mail_login/firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mail_login/models/email.dart';
import 'logger.dart';
import 'dart:io';
import 'package:enough_mail/enough_mail.dart';

String? userName;
String? password;

String popServerHost = 'pop.domain.com';
int popServerPort = 995;
bool isPopServerSecure = true;

String smtpServerHost = 'smtp.cc.iitk.ac.in';
int smtpServerPort = 465;
bool isSmtpServerSecure = true;

String imapServerHost = 'newmailhost.cc.iitk.ac.in';
int imapServerPort = 993;
bool isImapServerSecure = true;
// Future<void> discoverExample() async {
//   var email = 'someone@enough.de';
//   var config = await Discover.discover(email, isLogEnabled: false);
//   if (config == null) {
//     defaultLogger.e('Unable to discover settings for $email');
//   } else {
//     defaultLogger.i('Settings for $email:');
//     if (config.emailProviders != null) {
//       for (var provider in config.emailProviders!) {
//         defaultLogger.i('provider: ${provider.displayName}');
//         defaultLogger.i('provider-domains: ${provider.domains}');
//         defaultLogger.i('documentation-url: ${provider.documentationUrl}');
//         defaultLogger.i('Incoming:');
//         defaultLogger.i(provider.preferredIncomingServer);
//         defaultLogger.i('Outgoing:');
//         defaultLogger.i(provider.preferredOutgoingServer);
//       }
//     } else {
//       defaultLogger.w('No email providers found.');
//     }
//   }
// }

/// Low level IMAP API usage example
Future<List<Email>> imapExample() async {
  final client = ImapClient(isLogEnabled: false);
  await dotenv.load(fileName: ".env");
  userName = dotenv.env['USERNAME'];
  password = dotenv.env['PASSWORD'];
  List<Email> emails = [];
  try {
    await client.connectToServer(imapServerHost, imapServerPort,
        isSecure: isImapServerSecure);
    await client.login(userName!, password!);
    final mailboxes = await client.listMailboxes();
    defaultLogger.i('mailboxes: $mailboxes');
    await client.selectInbox();
    // fetch 10 most recent messages:
    final fetchResult = await client.fetchRecentMessages(
        messageCount: 10, criteria: 'BODY.PEEK[]');
    for (final message in fetchResult.messages) {
      emails.add(
        Email(
          '', // profileImage
          "", // userName
          message.decodeSubject() ?? "", // subject
          message.decodeTextPlainPart() ?? "", // body
          message.decodeDate() ?? DateTime.now(), // dateTime
          message.from?.firstOrNull?.email ?? "", // email
        ),
      );
    }
    await client.logout();
  } on ImapException catch (e) {
    defaultLogger.i('IMAP failed with $e');
  }
  return emails;
}

/// Low level SMTP API example
Future<void> smtpExample(
    String from, String to, String subject, String body) async {
  final client = SmtpClient('smtp.cc.iitk.ac.in', isLogEnabled: true);
  await dotenv.load(fileName: ".env");
  password = dotenv.env['PASSWORD'];

  final fromAddress = MailAddress('', from);
  final toAddress = MailAddress('', to);

  try {
    await client.connectToServer(smtpServerHost, smtpServerPort,
        isSecure: isSmtpServerSecure);
    await client.ehlo();
    if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
      await client.authenticate(from, password!, AuthMechanism.plain);
    } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
      await client.authenticate(from, password!, AuthMechanism.login);
    } else {
      return;
    }
    final builder = MessageBuilder.prepareMultipartAlternativeMessage(
      plainText: body,
      htmlText: '<p>$body</p>',
    )
      ..from = [fromAddress]
      ..to = [toAddress]
      ..subject = subject;
    final mimeMessage = builder.buildMimeMessage();
    final sendResponse = await client.sendMessage(mimeMessage);
    defaultLogger.i('message sent: ${sendResponse.isOkStatus}');
  } on SmtpException catch (e) {
    defaultLogger.e('SMTP failed with $e');
  }
}

/// Low level POP3 API example
// Future<void> popExample() async {
//   final client = PopClient(isLogEnabled: false);
//   try {
//     await client.connectToServer(popServerHost, popServerPort,
//         isSecure: isPopServerSecure);
//     await client.login(userName, password);
//     // alternative login:
//     // await client.loginWithApop(userName, password); // optional different login mechanism
//     final status = await client.status();
//     defaultLogger.i(
//         'status: messages count=${status.numberOfMessages}, messages size=${status.totalSizeInBytes}');
//     final messageList = await client.list(status.numberOfMessages);
//     defaultLogger.i(
//         'last message: id=${messageList.first.id} size=${messageList.first.sizeInBytes}');
//     var message = await client.retrieve(status.numberOfMessages);
//     defaultLoggerMessage(message);
//     message = await client.retrieve(status.numberOfMessages + 1);
//     defaultLogger.i('trying to retrieve newer message succeeded');
//     await client.quit();
//   } on PopException catch (e) {
//     defaultLogger.e('POP failed with $e');
//   }
// }

// void defaultLoggerMessage(MimeMessage message) {
//   defaultLogger
//       .i('from: ${message.from} with subject "${message.decodeSubject()}"');
//   if (!message.isTextPlainMessage()) {
//     defaultLogger.i(' content-type: ${message.mediaType}');
//   } else {
//     final plainText = message.decodeTextPlainPart();
//     if (plainText != null) {
//       final lines = plainText.split('\r\n');
//       for (final line in lines) {
//         if (line.startsWith('>')) {
//           // break when quoted text starts
//           break;
//         }
//         defaultLogger.i(line);
//       }
//     }
//   }
// }

class EmailService {
  static void sendEmail(String from, String to, String subject, String body) {
    // Implement your email sending logic here
    defaultLogger.i('Sending email...');
    defaultLogger.i('From: $from');
    defaultLogger.i('To: $to');
    defaultLogger.i('Subject: $subject');
    defaultLogger.i('Body: $body');
    smtpExample(from, to, subject, body);
    defaultLogger.i('Email sent!');
  }
}

class LatestMail {
  static void recieveEmail() {
    imapExample();
  }
}
