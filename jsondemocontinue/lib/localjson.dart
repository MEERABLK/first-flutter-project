import 'dart:convert'; // this is used to converting
// json object to dart object

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// access local Json data from the assets

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocalJson(),
    );
  }
}

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  //store list of data
  List _items = [];

  Future<void> readjson() async {
    //asset contains
    final String response = await rootBundle.loadString('asset/sample.json');

    //convert json to dart object
    final data = await jsonDecode(response);

    setState(() {
      //as a list stream of data
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: readjson, child: Text("Load Data")),
          // display the data that is loaded from sample.json
          _items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            //from json key value pair data do not make mistake when typing the key
                            leading: Text(_items[index]["id"]),
                            title: Text(_items[index]["name"]),
                            tileColor: Colors.amber,
                            subtitle: Text(_items[index]["description"]),
                          ),
                        );
                      }),
                )
      //contain space for expanded
              : Container()
        ],
      ),
    );
  }
}
