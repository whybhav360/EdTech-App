import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_variables.dart';


class QuestionOfTheDay extends StatefulWidget {
  const QuestionOfTheDay({super.key});

  @override
  State<QuestionOfTheDay> createState() => _QuestionOfTheDayState();
}

class _QuestionOfTheDayState extends State<QuestionOfTheDay> {
  int? _selectedOptionIndex;
  bool _isSubmitted = false;
  final int correctOption = 2;
  final String _explanationText = "Because Correct Answer is Option C.";

  @override
  void initState() {
    super.initState();
    _loadSavedState();
  }

  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSubmitted = prefs.getBool('isSubmitted') ?? false;
      _selectedOptionIndex = prefs.getInt('selectedOptionIndex');
    });
  }

  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSubmitted', _isSubmitted);
    if (_selectedOptionIndex != null) {
      await prefs.setInt('selectedOptionIndex', _selectedOptionIndex!);
    }
  }

  void _handleOptionTap(int index) {
    if (_isSubmitted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Already attempted today's question"),
        ),
      );
      return;
    }
    setState(() {
      _selectedOptionIndex = index;
    });
  }

  void _handleSubmit() {
    if (_selectedOptionIndex == null) return;
    setState(() {
      _isSubmitted = true;
    });
    _saveState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QUESTION OF THE DAY",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: HtmlWidget(htmlQuestion),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _buildOptionItem(index);
              },
            ),

            if (_isSubmitted) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Answer: ",
                    style: TextStyle(
                      color: _selectedOptionIndex == correctOption
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: HtmlWidget(
                      options[_selectedOptionIndex!],
                      textStyle: TextStyle(
                        color: _selectedOptionIndex == correctOption
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Correct Answer: ",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  HtmlWidget(
                    options[correctOption],
                    textStyle: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Explanation:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              Text(
                _explanationText,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 16),
            ],
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isSubmitted || _selectedOptionIndex == null
                    ? null
                    : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.grey.shade700,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(int index) {
    final bool isSelected = _selectedOptionIndex == index;
    final bool isCorrect = index == correctOption;

    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade400;

    if (_isSubmitted) {
      if (isCorrect) {
        backgroundColor = Colors.green.withValues(alpha: .3);
        borderColor = Colors.green;
      } else if (isSelected) {
        backgroundColor = const Color.fromRGBO(241, 182, 188, 0.5);
        borderColor = Colors.red;
      }
    } else if (isSelected) {
      backgroundColor = Colors.white;
      borderColor = Colors.deepPurple;
    }

    return GestureDetector(
      onTap: () => _handleOptionTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepPurple : Colors.transparent,
                border: Border.all(
                  color: isSelected ? Colors.deepPurple : Colors.grey.shade600,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: HtmlWidget(
                options[index],
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
