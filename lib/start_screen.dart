import 'package:flutter/material.dart';
import 'package:quiz/Const/colors.dart';

import 'question_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 100,
                color: Colors.white,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    color: primary,
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionScreen(),
                      )),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.white.withOpacity(0.8))),
                  label: const Text('Start Quiz!',
                      style: TextStyle(color: primary)))
            ],
          ),
        ));
  }
}
