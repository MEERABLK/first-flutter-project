import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceHomePage(),
    );
  }
}

class DiceHomePage extends StatefulWidget {
  const DiceHomePage({super.key});

  @override
  _DiceHomePageState createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {
  var imageArray = [
    'one.png',
    'two.png',
    'three.png',
    'four.png',
    'five.png',
    'six.png'
  ];

  int diceOne = 0;
  int diceTwo = 0;

  void rollDice() {
    setState(() {
      diceOne = Random().nextInt(6);
      diceTwo = Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    int sum = diceOne + diceTwo + 2; // +2 because index starts at 0

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The sum is: $sum',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/${imageArray[diceOne]}',
                      height: 120, width: 120),
                  Image.asset('assets/${imageArray[diceTwo]}',
                      height: 120, width: 120),
                ],
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: rollDice,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Roll Dice',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
