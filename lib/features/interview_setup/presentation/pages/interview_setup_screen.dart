import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/interview_setup_constants.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/styles/interview_setup_screen_styles.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/add_skill_button.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/custom_skill_text_field.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/selectable_tag_list.dart';
import 'package:flutter_application_1/screens/ChatScreen.dart';

class InterviewSetupScreen extends StatefulWidget {
  const InterviewSetupScreen({super.key});

  @override
  State<InterviewSetupScreen> createState() => _InterviewSetupScreenState();
}

class _InterviewSetupScreenState extends State<InterviewSetupScreen> {
  static const int recommendedLanguageLimit = 10;

  String selectedField = '';
  final List<String> selectedLanguages = [];
  String selectedLevel = 'Junior';
  String selectedType = 'Technical';
  int questionCount = 5;
  final TextEditingController customLanguageController =
      TextEditingController();
  final Map<String, List<String>> customLanguagesByField = {};

  @override
  void dispose() {
    customLanguageController.dispose();
    super.dispose();
  }

  List<String> get visibleLanguageOptions {
    if (selectedField.isEmpty) {
      return [];
    }

    return [
      ...skills[selectedField]!.take(
        recommendedLanguageLimit,
      ),
      ...?customLanguagesByField[selectedField],
    ];
  }

  void addCustomLanguage() {
    if (selectedField.isEmpty) {
      return;
    }

    final String customLanguage = customLanguageController.text.trim();

    if (customLanguage.isEmpty ||
        visibleLanguageOptions.contains(customLanguage)) {
      return;
    }

    setState(() {
      customLanguagesByField.putIfAbsent(selectedField, () => []);
      customLanguagesByField[selectedField]!.add(customLanguage);
      selectedLanguages.add(customLanguage);
      customLanguageController.clear();
    });
  }

  void toggleLanguage(String language) {
    setState(() {
      if (selectedLanguages.contains(language)) {
        selectedLanguages.remove(language);
      } else {
        selectedLanguages.add(language);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InterviewSetupScreenStyles.screenBackgroundColor,
      appBar: AppBar(
        title: const Text('Interview Setup'),
        backgroundColor: InterviewSetupScreenStyles.primaryColor,
        foregroundColor: InterviewSetupScreenStyles.selectedTextColor,
      ),
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
                    selectedLanguages.clear();
                  });
                },
              ),
              InterviewSetupScreenStyles.sectionGap,
              const _SectionTitle(title: 'Skills'),
              InterviewSetupScreenStyles.sectionTitleContentGap,
              if (selectedField.isEmpty)
                Container(
                  padding: InterviewSetupScreenStyles.fieldPadding,
                  decoration:
                      InterviewSetupScreenStyles.disabledFieldDecoration(),
                  child: Text(
                    'Choose a field first',
                    style: InterviewSetupScreenStyles.disabledFieldTextStyle(),
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SelectableTagList(
                      options: visibleLanguageOptions,
                      selectedOptions: selectedLanguages,
                      onSelected: toggleLanguage,
                    ),
                    InterviewSetupScreenStyles.skillsInputGap,
                    Row(
                      children: [
                        Expanded(
                          child: CustomSkillTextField(
                            controller: customLanguageController,
                            onSubmitted: addCustomLanguage,
                          ),
                        ),
                        InterviewSetupScreenStyles.addSkillButtonGap,
                        AddSkillButton(onPressed: addCustomLanguage),
                      ],
                    ),
                  ],
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
                  DropdownMenuItem(value: 5, child: Text('5 questions')),
                  DropdownMenuItem(value: 10, child: Text('10 questions')),
                  DropdownMenuItem(value: 15, child: Text('15 questions')),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                style: InterviewSetupScreenStyles.startButtonStyle(),
                child: const Text(
                  'Start Interview',
                  style: InterviewSetupScreenStyles.startButtonTextStyle,
                ),
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
