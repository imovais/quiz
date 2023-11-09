import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';

import 'Const/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({super.key, required this.questionIndex});

  int questionIndex;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
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
                  'Your X out of Y are correct!',
                  style: GoogleFonts.lato(fontSize: 20, color: white),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: Colors.grey,
                ),
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
}
