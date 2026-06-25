import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/interview_setup_constants.dart';
import 'package:flutter_application_1/features/chat/presentation/pages/chat_screen.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/styles/interview_setup_screen_styles.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/selectable_tag_list.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/skill_selection_section.dart';
import 'package:flutter_application_1/shared/widgets/app_header.dart';
import 'package:flutter_application_1/shared/widgets/primary_action_button.dart';

class InterviewSetupScreen extends StatefulWidget {
  const InterviewSetupScreen({super.key});

  @override
  State<InterviewSetupScreen> createState() => _InterviewSetupScreenState();
}

class _InterviewSetupScreenState extends State<InterviewSetupScreen> {
  static const int recommendedSkillLimit = 10;

  String selectedField = '';
  final List<String> selectedSkills = [];
  String selectedLevel = 'Junior';
  String selectedType = 'Technical';
  int questionCount = 10;
  final TextEditingController customSkillController = TextEditingController();
  final Map<String, List<String>> customSkillsByField = {};

  @override
  void dispose() {
    customSkillController.dispose();
    super.dispose();
  }

  List<String> get visibleSkillOptions {
    if (selectedField.isEmpty) {
      return [];
    }

    return [
      ...skills[selectedField]!.take(
        recommendedSkillLimit,
      ),
      ...?customSkillsByField[selectedField],
    ];
  }

  void addCustomSkill() {
    if (selectedField.isEmpty) {
      return;
    }

    final String customSkill = customSkillController.text.trim();

    if (customSkill.isEmpty || visibleSkillOptions.contains(customSkill)) {
      return;
    }

    setState(() {
      customSkillsByField.putIfAbsent(selectedField, () => []);
      customSkillsByField[selectedField]!.add(customSkill);
      selectedSkills.add(customSkill);
      customSkillController.clear();
    });
  }

  void toggleSkill(String skill) {
    setState(() {
      if (selectedSkills.contains(skill)) {
        selectedSkills.remove(skill);
      } else {
        selectedSkills.add(skill);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InterviewSetupScreenStyles.screenBackgroundColor,
      appBar: const AppHeader(title: 'Interview Setup'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: InterviewSetupScreenStyles.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.tune,
                size: InterviewSetupScreenStyles.headerIconSize,
                color: InterviewSetupScreenStyles.primaryColor,
              ),
              InterviewSetupScreenStyles.headerIconTitleGap,
              const Text(
                'Customize your interview',
                textAlign: TextAlign.center,
                style: InterviewSetupScreenStyles.titleTextStyle,
              ),
              InterviewSetupScreenStyles.titleSubtitleGap,
              const Text(
                'Choose your target role and interview style.',
                textAlign: TextAlign.center,
                style: InterviewSetupScreenStyles.subtitleTextStyle,
              ),
              InterviewSetupScreenStyles.headerSectionGap,
              const _SectionTitle(title: 'Field'),
              InterviewSetupScreenStyles.sectionTitleContentGap,
              SelectableTagList(
                options: interviewFields,
                selectedOptions: selectedField.isEmpty ? [] : [selectedField],
                onSelected: (value) {
                  setState(() {
                    selectedField = value;
                    selectedSkills.clear();
                  });
                },
              ),
              InterviewSetupScreenStyles.sectionGap,
              const _SectionTitle(title: 'Skills'),
              InterviewSetupScreenStyles.sectionTitleContentGap,
              SkillSelectionSection(
                isEnabled: selectedField.isNotEmpty,
                options: visibleSkillOptions,
                selectedSkills: selectedSkills,
                controller: customSkillController,
                onSkillSelected: toggleSkill,
                onSkillAdded: addCustomSkill,
              ),
              InterviewSetupScreenStyles.sectionGap,
              const _SectionTitle(title: 'Experience Level'),
              InterviewSetupScreenStyles.sectionTitleContentGap,
              SelectableTagList(
                options: interviewLevels,
                selectedOptions: [selectedLevel],
                onSelected: (value) {
                  setState(() {
                    selectedLevel = value;
                  });
                },
              ),
              InterviewSetupScreenStyles.sectionGap,
              const _SectionTitle(title: 'Interview Type'),
              InterviewSetupScreenStyles.sectionTitleContentGap,
              SelectableTagList(
                options: interviewTypes,
                selectedOptions: [selectedType],
                onSelected: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
              InterviewSetupScreenStyles.sectionGap,
              const _SectionTitle(title: 'Questions'),
              InterviewSetupScreenStyles.sectionTitleContentGap,
              DropdownButtonFormField<int>(
                value: questionCount,
                decoration: InterviewSetupScreenStyles.dropdownDecoration(),
                items: const [
                  DropdownMenuItem(value: 10, child: Text('10 questions')),
                  DropdownMenuItem(value: 15, child: Text('15 questions')),
                  DropdownMenuItem(value: 20, child: Text('20 questions')),
                ],
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    questionCount = value;
                  });
                },
              ),
              InterviewSetupScreenStyles.bottomButtonGap,
              PrimaryActionButton(
                label: 'Start Interview',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        questionCount: questionCount,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: InterviewSetupScreenStyles.sectionTitleTextStyle,
    );
  }
}
