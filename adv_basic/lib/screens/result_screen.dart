import 'package:flutter/material.dart';
import 'package:adv_basic/data/question.dart';
import 'package:adv_basic/questions_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers , required this.onRestart});
  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question index': i,
        'Question': questions[i].text,
        'Correct Answer': questions[i].answers[0],
        'choosen answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numOfTotQuestions = questions.length;
    final numOfCorrectQuestions = summaryData.where((data) {
      return data['Correct Answer'] == data['choosen answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answered $numOfCorrectQuestions out of $numOfTotQuestions Questions correctly!',
              style: const TextStyle(
                color: Color.fromARGB(255, 195, 148, 204),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),

            ),
            const SizedBox(height: 20),
            QuestionSummary(summaryData),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: onRestart,
              label: const Text(
                'Restart quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              icon: const Icon(Icons.refresh),

            ),
          ],
        ),
      ),
    );
  }
}
