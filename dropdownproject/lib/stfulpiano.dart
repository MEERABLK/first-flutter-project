import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _value = 5;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.volume_up,
            size:40,),
            Expanded(
            //     child: Slider(
            //         value: _value.toDouble(),
            //         max: 20.0,
            //         min: 1.0,
            //         activeColor: Colors.green,
            // inactiveColor: Colors.blueAccent,
            //     label: 'set vlumne control',
            // OnChanged:(double newValue){
            //   setState(() {
            //     _value = newValue.round();
            //   });
            // })
              child: Slider(value: _value.toDouble() ,max: 20.0,min: 1.0,
                  activeColor: Colors.green,inactiveColor: Colors.blueAccent
                  ,label: 'set volume',onChanged: (double newValue) {
                setState(() {
                  _value = newValue.round();
                });
              }),
              )
          ],
        ),
      ),
    );
  }
}
