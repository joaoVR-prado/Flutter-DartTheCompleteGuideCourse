import 'package:flutter/material.dart';
import 'package:flutter_unit_3/data/questions.dart';
import 'package:flutter_unit_3/questions_screen.dart';
import 'package:flutter_unit_3/quiz_action.dart';
import 'package:flutter_unit_3/results_screen.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget{
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState(){
    return _GradientContainerState();

  }
}

class _GradientContainerState extends State<GradientContainer>{
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";
  
  void switchScreen(){
    setState(() {
      activeScreen = "questions-screen";

    });
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";

    });

  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = "results-screen";

      });

    }

  }
  
  @override
  Widget build(context){
    Widget screenWidget = QuizAction(switchScreen);

  if(activeScreen == "questions-screen"){
    screenWidget = QuestionsScreen(
      onSelecetAnswer: chooseAnswer
    );
  }
    
  if(activeScreen == "results-screen"){
    screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);

  }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 26, 2, 80),
              Color.fromARGB(255, 45, 7, 99)
            ],
            begin: startAlignment,
            end: endAlignment
          ),
        ),
        child: screenWidget,
      ),
      ),
    );
  }
}