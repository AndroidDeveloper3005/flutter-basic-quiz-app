import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer_button.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestions.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),
            //dynamic button for answers
            // spread operator(  ...  )
            ...currentQuestions.getShuffledAnswers().map((answers) {
              return AnswerButton(answer: answers, onTap: (){
                answerQuestion(answers);

              },);
            }),
            // AnswerButton("Answer 1",(){}),
            // AnswerButton("Answer 2",(){}),
            // AnswerButton("Answer 3",(){}),
            // AnswerButton("Answer 4",(){}),
            // AnswerButton(answer: currentQuestions.answers[0], onTap: (){}),
            // AnswerButton(answer: currentQuestions.answers[1], onTap: (){}),
            // AnswerButton(answer: currentQuestions.answers[2], onTap: (){}),
            // AnswerButton(answer: currentQuestions.answers[3], onTap: (){}),
          ],
        ),
      ),
    );
  }
}
