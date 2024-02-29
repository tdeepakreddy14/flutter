import 'package:adv_basic/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required, required this.summaryData});
  final Map<String, Object> summaryData;

  @override
  Widget build(context) {
    final bool isCorrectAnswer =
        summaryData['choosen answer'] == summaryData['Correct Answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: summaryData['question index'] as int),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryData['Question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  (summaryData['choosen answer']) as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 189, 34, 228),
                    fontSize: 17,
                  ),
                ),
                Text(
                  (summaryData['Correct Answer']) as String,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
