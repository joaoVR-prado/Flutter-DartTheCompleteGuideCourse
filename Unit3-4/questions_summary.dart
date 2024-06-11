import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionsSummary extends StatelessWidget{
  QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  var color = Colors.red;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              if(data["user_answer"] == data["correct_answer"]){
                color = Colors.lightGreen;

              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    maxRadius: 15,
                    child: Text(
                      ((data["question_index"] as int) + 1).toString()
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded( // Garante que a altura maxima seja do widget pai, nesse caso a Row
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.white
                          ),
                          (data["question"] as String)
                        ),
                        const SizedBox(height: 5),
                        Text(
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.grey
                          ),
                          data["user_answer"] as String
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.lightGreen
                          ),
                          data["correct_answer"] as String
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  )
                ]
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}