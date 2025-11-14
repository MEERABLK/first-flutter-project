import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}


_makecall()async
{
  const url ='https://www.youtube.com/';
  const url ='tel:43686';

  //final Uri phoneUri = Uri(scheme: 'tel',path: )
  if(await launch(url)) {
    await launch(url);
  }
  else
    {
      throw 'cont not launch $url';
    }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Phone '),

            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Text('call this num'),
                    ElevatedButton(onPressed: _makecall, child: Text('appele'))
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}