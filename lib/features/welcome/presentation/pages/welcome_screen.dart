import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/pages/interview_setup_screen.dart';
import 'package:flutter_application_1/shared/widgets/primary_action_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Logo Icon
              const Icon(
                Icons.psychology,
                size: 100,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 24),
              // Main Title
              const Text(
                'InterBuddy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              const Text(
                'Practice realistic interviews with AI\nand achieve your dreams.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              PrimaryActionButton(
                label: 'Start Interview Practice',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InterviewSetupScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
