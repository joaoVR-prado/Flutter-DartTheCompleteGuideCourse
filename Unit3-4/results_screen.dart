import "package:flutter/material.dart";
import "package:flutter_unit_3/data/questions.dart";
import "package:flutter_unit_3/questions_summary.dart";
import "package:google_fonts/google_fonts.dart";

class ResultsScreen extends StatelessWidget{
  const ResultsScreen(
    {super.key, 
    required this.chosenAnswers,
    required this.onRestart,
    }
  );

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(int i =0; i<chosenAnswers.length; i++){
      summary.add({
        "question_index": i,
        "question" : questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }

    return summary;

  }

  @override
  Widget build(context){
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data["user_answer"] == data["correct_answer"];

    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!"
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                onRestart();

              },
              icon: const Icon(Icons.restart_alt),
              label: Text(
                style: GoogleFonts.roboto(
                color: Colors.white,
              ),
                "Restart Quiz."
              ),
            )
          ],
        ),
      ),
    );
  }
}