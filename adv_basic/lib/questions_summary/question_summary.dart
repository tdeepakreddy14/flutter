import 'package:flutter/material.dart';
import 'package:adv_basic/questions_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (e) {
               return SummaryItem(summaryData: e);
            },
          ).toList(),
        ),
      ),
    );
  }
}
