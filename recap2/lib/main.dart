import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  MyFirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyFirstPage extends StatelessWidget {

  final List<String> items = ['fruits','salads','veggies'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('new connection'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('hello first page'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                //material page route is the main widget that causes the transition

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //   builder: (context) => SecondScreen(data: 'new',data1:'another')));
                        builder: (context) => SecondScreen(items: items)));

              },
              child: const Text('go second'),
            ),
          ],
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {

  //final String data,data1;

  //SecondScreen({required this.data,required this.data1});
  final List<String>items;
  SecondScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second page'),
      ),
      body:

      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index)
        {
          return ListTile(
            title: Text(items[index]),

          );
        },
      ),

      // SizedBox(height: 30,),
      // ElevatedButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: const Text('go last'),
      //),



    );
  }
}