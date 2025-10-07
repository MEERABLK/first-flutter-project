import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:MyApp(),theme: ThemeData.dark(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [CircularProgressIndicator(
            color: Colors.amber,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            strokeWidth: 10,
          ),

          SizedBox(height: 10,),LinearProgressIndicator(
              backgroundColor: Colors.red,
              valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
              minHeight: 20,
            )],

        ),
      ),
    );
  }
}
