import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceProject());
}

class DiceProject extends StatelessWidget {
  const DiceProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceProjectRoll(),

    );
  }
}
class DiceProjectRoll extends StatefulWidget {
  const DiceProjectRoll({super.key});

  @override
  State<DiceProjectRoll> createState() => _DiceProjectRollState();
}

class _DiceProjectRollState extends State<DiceProjectRoll> {
  var imageArray = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png', 'six.png'];

  var random = new Random();
  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(

        child: Column(
          children: [

            Text('The sum is: $sum'),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

            Image.asset('assets/one.png',height:80,width: 80, ),
            Image.asset('assets/three.png',height:80, width: 80,),
            ]),
            Column(
              children: [ElevatedButton(
                  onPressed: (){
              },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,

                    ),

                  ),
                  child: Text('Roll Dice',style: TextStyle(color: Colors.black),),)],
            )
          ],
          

        ),

      ),

    );
  }
}
