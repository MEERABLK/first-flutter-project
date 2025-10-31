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

  String dropDownvalue ='USA';

  //list of items in the container
  var items = ['USA','China','India','UK','Poland','Tunisia','France'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: 100),
            child:
            DropdownButton(
                value: dropDownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
            items: items.map((String items){
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items));
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    dropDownvalue = newValue!;
                  });
                })
            ),
        ],
        ),
      ) ,
    );
  }
}
