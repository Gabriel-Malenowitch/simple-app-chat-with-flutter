import 'package:flutter/material.dart';
import 'package:simple_app_chat/pages/chat.dart';
import 'package:simple_app_chat/pages/chats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uati Zap 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade50),
      ),
      initialRoute: '/chats',
      routes: {
        '/chats': (context) => const Chats(),
        '/chat': (context) => const Chat()
      },
    );
  }
}
