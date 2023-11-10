import 'package:flutter/material.dart';
import 'package:quiz/Const/colors.dart';
import 'package:quiz/Model/questions_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;
  var selectedAnswer = '';
  List<Map<String, Object>> summaryList = [];

  void changeQuestion() {
    setState(() {
      if ((data.length - 1) > questionIndex) {
        questionIndex++;
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                  questionIndex: questionIndex, summarydata: summaryList),
            ));
      }
    });
  }

  List<String> getSufflist() {
    final sufflelist = List.of(data[questionIndex].answers);
    sufflelist.shuffle();
    return sufflelist;
  }

//working on summary data
  void summarydata() {
    summaryList.add({
      'questionIndex': questionIndex + 1,
      'question': data[questionIndex].question,
      'correctAnswer': data[questionIndex].answers[0],
      'SelectedAnswer': selectedAnswer,
      'result':
          data[questionIndex].answers[0] == selectedAnswer ? "Correct" : "Wrong"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                data[questionIndex].question.toString(),
                style: GoogleFonts.lato(
                    color: white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...getSufflist().map((ans) {
                return AnswerButton(
                    text: ans,
                    ontap: () {
                      selectedAnswer = ans;
                      summarydata();
                      changeQuestion();
                    });
              })
            ],
          ),
        ));
  }
}

//Answer Button
class AnswerButton extends StatelessWidget {
  AnswerButton({
    required this.text,
    required this.ontap,
    super.key,
  });

  final String text;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(white),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))))),
      child: Text(
        text,
        style: const TextStyle(color: primary),
      ),
    );
  }
}
