import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/interview_setup_constants.dart';
import 'package:flutter_application_1/screens/ChatScreen.dart';

class InterviewSetupScreen extends StatefulWidget {
  const InterviewSetupScreen({super.key});

  @override
  State<InterviewSetupScreen> createState() => _InterviewSetupScreenState();
}

class _InterviewSetupScreenState extends State<InterviewSetupScreen> {
  static const int recommendedLanguageLimit = 10;

  String selectedField = '';
  String selectedLanguage = '';
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
      ...programmingLanguagesByField[selectedField]!.take(
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
      selectedLanguage = customLanguage;
      customLanguageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Interview Setup'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.tune,
                size: 72,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 20),
              const Text(
                'Customize your interview',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your target role and interview style.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              const _SectionTitle(title: 'Field'),
              const SizedBox(height: 12),
              _ChoiceGroup(
                options: interviewFields,
                selectedOption: selectedField,
                onSelected: (value) {
                  setState(() {
                    selectedField = value;
                    selectedLanguage = '';
                  });
                },
              ),
              const SizedBox(height: 28),
              const _SectionTitle(title: 'Programming Language'),
              const SizedBox(height: 12),
              _LanguageSelector(
                options: visibleLanguageOptions,
                selectedLanguage: selectedLanguage,
                isEnabled: selectedField.isNotEmpty,
                controller: customLanguageController,
                onSelected: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
                onAdd: addCustomLanguage,
              ),
              const SizedBox(height: 28),
              const _SectionTitle(title: 'Experience Level'),
              const SizedBox(height: 12),
              _ChoiceGroup(
                options: interviewLevels,
                selectedOption: selectedLevel,
                onSelected: (value) {
                  setState(() {
                    selectedLevel = value;
                  });
                },
              ),
              const SizedBox(height: 28),
              const _SectionTitle(title: 'Interview Type'),
              const SizedBox(height: 12),
              _ChoiceGroup(
                options: interviewTypes,
                selectedOption: selectedType,
                onSelected: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
              const SizedBox(height: 28),
              const _SectionTitle(title: 'Questions'),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                value: questionCount,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
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
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ).copyWith(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const Text(
                  'Start Interview',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({
    required this.options,
    required this.selectedLanguage,
    required this.isEnabled,
    required this.controller,
    required this.onSelected,
    required this.onAdd,
  });

  final List<String> options;
  final String selectedLanguage;
  final bool isEnabled;
  final TextEditingController controller;
  final ValueChanged<String> onSelected;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          'Choose a field first',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ChoiceGroup(
          options: options,
          selectedOption: selectedLanguage,
          onSelected: onSelected,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Add your language or stack',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                onSubmitted: (_) => onAdd(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              tooltip: 'Add language',
            ),
          ],
        ),
      ],
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
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

class _ChoiceGroup extends StatelessWidget {
  const _ChoiceGroup({
    required this.options,
    required this.selectedOption,
    required this.onSelected,
  });

  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        final bool isSelected = option == selectedOption;

        return Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ChoiceChip(
            label: Text(option),
            selected: isSelected,
            selectedColor: Colors.blueAccent,
            pressElevation: 0,
            showCheckmark: true,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            backgroundColor: Colors.grey.shade100,
            side: BorderSide(
              color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
            ),
            onSelected: (_) => onSelected(option),
          ),
        );
      }).toList(),
    );
  }
}
