import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/pages/interview_setup_screen.dart';
import 'package:flutter_application_1/features/welcome/presentation/styles/welcome_screen_styles.dart';
import 'package:flutter_application_1/shared/widgets/primary_action_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WelcomeScreenStyles.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: WelcomeScreenStyles.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(
                Icons.psychology,
                size: WelcomeScreenStyles.logoIconSize,
                color: WelcomeScreenStyles.primaryColor,
              ),
              WelcomeScreenStyles.logoTitleGap,
              const Text(
                'InterBuddy',
                textAlign: TextAlign.center,
                style: WelcomeScreenStyles.titleTextStyle,
              ),
              WelcomeScreenStyles.titleSubtitleGap,
              const Text(
                'Practice realistic interviews with AI\nand achieve your dreams.',
                textAlign: TextAlign.center,
                style: WelcomeScreenStyles.subtitleTextStyle,
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
              WelcomeScreenStyles.bottomGap,
            ],
          ),
        ),
      ),
    );
  }
}
