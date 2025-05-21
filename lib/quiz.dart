import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/start_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  //Widget? activeScreen;
  var activeScreen = 'start-screen';
  var startAlignment = Alignment.topLeft;
  var endAlignment = Alignment.bottomRight;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {


    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }


    //alternative
    // Widget screenWidget =
    //     activeScreen == 'start-screen'
    //         ? StartScreen(switchScreen)
    //         : QuestionsScreen(onSelectedAnswer: chooseAnswer);

    if (activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(chosenAnswer: selectedAnswer, onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 66, 23, 131),
                Color.fromARGB(255, 58, 13, 119),
              ],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          //child: activeScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
