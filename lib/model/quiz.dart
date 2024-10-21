import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/questions_screen.dart';
import 'package:quiz_app_2/model/results_screen.dart';
import 'package:quiz_app_2/model/start_screen.dart';
import 'package:quiz_app_2/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget? activeState;
  var activeState = 0;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeState = 2;
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeState = 1;
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeState = 1;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 119, 0, 246),
                  Color.fromARGB(255, 142, 95, 223)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: activeState == 0
                  ? StartScreen(switchScreen)
                  : activeState == 1
                      ? QuestionsScreen(onSelectAnswer: chooseAnswer)
                      : ResultsScreen(
                          chosenAnswers: selectedAnswers,
                          onRestart: restartQuiz))),
    );
  }
}
