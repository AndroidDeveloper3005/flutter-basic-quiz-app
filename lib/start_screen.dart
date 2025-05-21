import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255)
          ),
          const SizedBox(height: 50),
          Text(
            "Learn Flutter The Fun Way.",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_right_alt),
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: Text(
              "Start Quiz",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
