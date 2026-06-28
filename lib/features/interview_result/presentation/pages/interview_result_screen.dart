import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_result/presentation/styles/interview_result_screen_styles.dart';
import 'package:flutter_application_1/shared/widgets/app_header.dart';
import 'package:flutter_application_1/shared/widgets/primary_action_button.dart';

class InterviewResultScreen extends StatelessWidget {
  const InterviewResultScreen({
    required this.answeredQuestionCount,
    required this.totalQuestionCount,
    required this.totalAnswerLength,
    super.key,
  });

  final int answeredQuestionCount;
  final int totalQuestionCount;
  final int totalAnswerLength;

  int get score {
    if (totalQuestionCount <= 0 || answeredQuestionCount <= 0) {
      return 0;
    }

    final double completionRatio = answeredQuestionCount / totalQuestionCount;
    final double averageAnswerLength =
        totalAnswerLength / answeredQuestionCount;
    final double answerDepthRatio = (averageAnswerLength / 120).clamp(0, 1);
    final double rawScore = (completionRatio * 60) + (answerDepthRatio * 40);

    return rawScore.round().clamp(0, 100);
  }

  String get feedback {
    if (score >= 85) {
      return 'Great work. Your answers were complete and detailed enough to show clear problem-solving experience.';
    }

    if (score >= 70) {
      return 'Good session. Try adding more concrete trade-offs, metrics, and implementation details in your next practice.';
    }

    return 'Nice start. Focus on answering with situation, action, result, and one technical detail for each question.';
  }

  String get averageAnswerLengthLabel {
    if (answeredQuestionCount == 0) {
      return '0 chars';
    }

    final int averageAnswerLength =
        (totalAnswerLength / answeredQuestionCount).round();

    return '$averageAnswerLength chars';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InterviewResultScreenStyles.screenBackgroundColor,
      appBar: const AppHeader(title: 'Interview Result'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: InterviewResultScreenStyles.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                score >= 70 ? Icons.emoji_events : Icons.flag,
                size: InterviewResultScreenStyles.headerIconSize,
                color: score >= 70
                    ? InterviewResultScreenStyles.successColor
                    : InterviewResultScreenStyles.warningColor,
              ),
              InterviewResultScreenStyles.headerIconTitleGap,
              const Text(
                'Interview complete',
                textAlign: TextAlign.center,
                style: InterviewResultScreenStyles.titleTextStyle,
              ),
              InterviewResultScreenStyles.titleSubtitleGap,
              const Text(
                'Review your practice summary and try again with sharper answers.',
                textAlign: TextAlign.center,
                style: InterviewResultScreenStyles.subtitleTextStyle,
              ),
              InterviewResultScreenStyles.headerSectionGap,
              _ScorePanel(score: score),
              InterviewResultScreenStyles.sectionGap,
              Row(
                children: [
                  Expanded(
                    child: _ResultMetric(
                      label: 'Questions',
                      value: '$answeredQuestionCount / $totalQuestionCount',
                    ),
                  ),
                  InterviewResultScreenStyles.metricGap,
                  Expanded(
                    child: _ResultMetric(
                      label: 'Avg. answer',
                      value: averageAnswerLengthLabel,
                    ),
                  ),
                ],
              ),
              InterviewResultScreenStyles.sectionGap,
              const Text(
                'Feedback',
                style: InterviewResultScreenStyles.sectionTitleTextStyle,
              ),
              InterviewResultScreenStyles.compactGap,
              Container(
                padding: InterviewResultScreenStyles.feedbackPadding,
                decoration: InterviewResultScreenStyles.panelDecoration(),
                child: Text(
                  feedback,
                  style: InterviewResultScreenStyles.feedbackTextStyle,
                ),
              ),
              InterviewResultScreenStyles.bottomButtonGap,
              PrimaryActionButton(
                label: 'Back to Setup',
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScorePanel extends StatelessWidget {
  const _ScorePanel({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: InterviewResultScreenStyles.scorePanelPadding,
      decoration: InterviewResultScreenStyles.panelDecoration(),
      child: Column(
        children: [
          Container(
            width: InterviewResultScreenStyles.scoreCircleSize,
            height: InterviewResultScreenStyles.scoreCircleSize,
            decoration: InterviewResultScreenStyles.scoreCircleDecoration(),
            alignment: Alignment.center,
            child: Text(
              '$score',
              style: InterviewResultScreenStyles.scoreTextStyle,
            ),
          ),
          InterviewResultScreenStyles.compactGap,
          const Text(
            'Overall score',
            style: InterviewResultScreenStyles.scoreLabelTextStyle,
          ),
        ],
      ),
    );
  }
}

class _ResultMetric extends StatelessWidget {
  const _ResultMetric({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: InterviewResultScreenStyles.metricPanelPadding,
      decoration: InterviewResultScreenStyles.panelDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: InterviewResultScreenStyles.metricValueTextStyle,
          ),
          InterviewResultScreenStyles.compactGap,
          Text(
            label,
            style: InterviewResultScreenStyles.metricLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
