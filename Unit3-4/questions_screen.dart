import 'package:flutter/material.dart';
import 'package:flutter_unit_3/answer_button.dart';
import 'package:flutter_unit_3/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelecetAnswer});

  final void Function(String answer) onSelecetAnswer; 

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();

  }

}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelecetAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex +=1;
    });

  }

  @override
  Widget build(context){
    final currentQuestions = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestions.text, 
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,

              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestions.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer, onTap: () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );

  }


}