import 'package:flutter/material.dart';
import 'package:recap2/main.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context)=>FirstScreen(),
        '/second' : (context)=>SecondScreen(),
      },
    );
  }
}
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/second',arguments: "data config using named Route");
        },
              child: Text('Go'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //null or not
    final String? data = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      body: Column(
        children: [
          Text('$data'),
        ],
      ),
    );
  }
}

