import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  int counter2 = 0;

  void resetScores() {
    setState(() {
      counter = 0;
      counter2 = 0;
    });
  }

  void compareScore() {
    String message;

    if (counter > counter2) {
      message = 'Team A won!';
    } else if (counter2 > counter) {
      message = 'Team B won!';
    } else {
      message = 'It is a tie!';
    }

    // Show SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basketball Points Counter'),
      ),

      body: Padding(
        //same value each corner
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           // Expanded is used to fit the entire column widgets inside the given space
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Team A
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Team A', style: TextStyle(fontSize: 24)),
                        const SizedBox(height: 10),
                        Text('$counter', style: const TextStyle(fontSize: 48)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter += 1;
                            });
                          },
                          child: const Text("Add 1 Point"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter += 2;
                            });
                          },
                          child: const Text("Add 2 Points"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter += 3;
                            });
                          },
                          child: const Text("Add 3 Points"),
                        ),
                      ],
                    ),
                  ),
                  //to divide team b
                  const VerticalDivider(
                    width: 40,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  // Team B
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Team B', style: TextStyle(fontSize: 24)),
                        const SizedBox(height: 10),
                        Text('$counter2', style: const TextStyle(fontSize: 48)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter2 += 1;
                            });
                          },
                          child: const Text("Add 1 Point"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter2 += 2;
                            });
                          },
                          child: const Text("Add 2 Points"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter2 += 3;
                            });
                          },
                          child: const Text("Add 3 Points"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: resetScores,
              child: const Text("Reset"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),


            ),
            ElevatedButton(
              onPressed: compareScore,
              child: const Text("Who's the winner?"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),


            ),
          ],
        ),
      ),
    );
  }
}
