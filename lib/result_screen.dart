import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';

import 'Const/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
      {super.key, required this.questionIndex, required this.summarydata});

  int questionIndex;
  List<Map<String, Object>> summarydata;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.summarydata);
    return Scaffold(
        backgroundColor: primary,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'You answered 1 out of 6 questions correctly!',
                  style: GoogleFonts.lato(fontSize: 20, color: white),
                  textAlign: TextAlign.center,
                ),
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...widget.summarydata.map((e) => resultListView(e))
                        ],
                      ),
                    )),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.questionIndex = 0;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartScreen(),
                          ));
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40))))),
                  child: const Text(
                    'Restart Quiz!',
                    style: TextStyle(color: primary),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Row resultListView(Map<String, Object> e) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: e['result'].toString() != 'Correct'
              ? const Color.fromARGB(255, 247, 158, 152).withOpacity(0.5)
              : const Color.fromARGB(255, 110, 255, 134).withOpacity(0.5),
          child: Text(
            e['questionIndex'].toString(),
            style: GoogleFonts.lato(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                  color: e['result'].toString() != 'Correct'
                      ? const Color.fromARGB(255, 247, 158, 152)
                      : const Color.fromARGB(255, 110, 255, 134),
                  width: 1,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10),
              // color: e['result'].toString() != 'Correct'
              //     ? const Color.fromARGB(255, 247, 158, 152).withOpacity(0.5)
              //     : const Color.fromARGB(255, 110, 255, 134)
              //         .withOpacity(0.5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e['question'].toString(),
                  style: const TextStyle(
                      color: white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your Answer: ${e['SelectedAnswer'].toString()}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 211, 188, 250)),
                ),
                Text('Correct Answer: ${e['correctAnswer'].toString()}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 211, 188, 250))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
