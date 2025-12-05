import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

_makecall() async {
  const url = 'tel:14369658996';
  if (await launch(url)) {
    await launch(url);
  } else {
    throw 'could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Phone Demo'),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Text('Call this number ',
                    style: TextStyle(
                        fontSize: 30.0
                    ),),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: _makecall,
                      child: Text('Appelle'))
                ],
              ),
            ),
          ),
        )
    );
  }
}