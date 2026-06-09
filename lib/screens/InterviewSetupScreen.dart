import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/interview_setup_constants.dart';
import 'package:flutter_application_1/screens/ChatScreen.dart';

class InterviewSetupScreen extends StatefulWidget {
  const InterviewSetupScreen({super.key});

  @override
  State<InterviewSetupScreen> createState() => _InterviewSetupScreenState();
}

class _InterviewSetupScreenState extends State<InterviewSetupScreen> {
  String selectedField = '';
  String selectedLanguage = '';
  String selectedLevel = 'Junior';
  String selectedType = 'Technical';
  int questionCount = 5;

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
              DropdownButtonFormField<String>(
                value: selectedLanguage.isEmpty ? null : selectedLanguage,
                menuMaxHeight: 280,
                decoration: InputDecoration(
                  labelText: 'Select language',
                  filled: selectedField.isEmpty,
                  fillColor: selectedField.isEmpty
                      ? Colors.grey.shade100
                      : Colors.white,
                  labelStyle: TextStyle(
                    color: selectedField.isEmpty
                        ? Colors.grey.shade600
                        : Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: selectedField.isEmpty
                          ? Colors.grey.shade300
                          : Colors.blueAccent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                items: selectedField.isEmpty
                    ? []
                    : programmingLanguagesByField[selectedField]!
                        .map(
                          (language) => DropdownMenuItem(
                            value: language,
                            child: Text(language),
                          ),
                        )
                        .toList(),
                onChanged: selectedField.isEmpty
                    ? null
                    : (value) {
                        if (value == null) return;
                        setState(() {
                          selectedLanguage = value;
                        });
                      },
                hint: const Text('Choose a field first'),
                disabledHint: const Text('Choose a field first'),
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
