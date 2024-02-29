import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basic/answer_button.dart';
import 'package:adv_basic/data/question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key , required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  
  var currentQuestionIndex = 0 ;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectedAnswer(selectedAnswers);
    setState(() {   // will re executr the build method.
      currentQuestionIndex++ ;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //for vertical
          crossAxisAlignment: CrossAxisAlignment.stretch, //for horizontel
          children: [
            Text(
              currentQuestion.text,
              
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 192, 181, 201),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ) ,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffeledAnswers().map((e) {
                return AnswerButton(
                  answerText: e,
                  onTap: (){
                    answerQuestion(e);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
