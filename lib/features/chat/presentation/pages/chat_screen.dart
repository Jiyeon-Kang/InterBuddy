import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/app_header.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'InterBuddy - AI Interviewer'),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'AI Interviewer conversation will be displayed here.',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your answer here...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.blueAccent,
                    onPressed: () {
                      // TODO: Handle sending message
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
