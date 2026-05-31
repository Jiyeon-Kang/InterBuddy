import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ChatScreen.dart';

void main() {
  runApp(const InterBuddyApp());
}

class InterBuddyApp extends StatelessWidget {
  const InterBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}
