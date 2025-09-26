import 'package:flutter/material.dart';

void main() {
  runApp(SecondProject());
}
class SecondProject extends StatelessWidget
{
  const SecondProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPicture(),

    );
  }
}
  class FirstPicture extends StatelessWidget
  {
  const FirstPicture({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("BD Card"),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              children: [
              Text('To My Friends',style:TextStyle(fontSize:25),),
            SizedBox(height:10,),
            Text('wed',style:TextStyle(fontSize:25),),
            SizedBox(height:10,),

            Icon(
              Icons.beach_access,
              color: Colors.deepOrange ,
              size: 40,
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.deepOrange ,
              size: 40,
            ),
            SizedBox(height:10,),
            InkWell(
              onTap: (){
                print("clicked");

              },
              child: Image.asset('Asset/ehehe.png', width: 100,height: 100,),
            ),
            Container(
              height: 200,
              width: 150,
              color: Colors.amberAccent,
              alignment: Alignment.center,
              child: Text("this is a container"),

            ),
            ],
        ),
    ),
    );
  }
  }