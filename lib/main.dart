import 'package:flutter/material.dart';
import 'package:quiz/classes/Question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: const SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  List<String> questions = [
    'question 1',
    'question 2',
    'question 3',
    'question 4'
  ];
  List<bool> answers = [true, false, false, true];
  int questionNumber = 0;

  List<Question> qu = [
    Question('question 1', true),
    Question('question 2', false),
    Question('question 3', false),
    Question('question 4', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                  child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25.0, color: Colors.yellow),
              )),
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == true) {
                  scoreKeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  if (questionNumber == 3) {
                    scoreKeeper = [];
                    questionNumber = 0;
                  } else {
                    questionNumber++;
                  }
                });
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == false) {
                  scoreKeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  if (questionNumber == 3) {
                    scoreKeeper = [];
                    questionNumber = 0;
                  } else {
                    questionNumber++;
                  }
                });
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
