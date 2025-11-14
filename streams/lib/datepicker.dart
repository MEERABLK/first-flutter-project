import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

DateTime currentDate = DateTime.now();
Future<void> _selectDate (BuildContext context)async {
  final DateTime? pickedDate = await showDatePicker
    (
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(2020),
    lastDate: DateTime(2030),);

  if (pickedDate != null && pickedDate != currentDate
  ) {
    setState(() {
      currentDate = pickedDate;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Date piker'),
      ),
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(currentDate.toLocal().toString().split(' ')[0]), // Display date string

        ElevatedButton(
            onPressed:()=>_selectDate(context),
            child: Text('DateTime'))],
        
      ),),
    );
  }
}





