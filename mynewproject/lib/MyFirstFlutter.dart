import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//lib ge properties for phone

void main() {
  //start app
  runApp(MyFirstFlutter());
}
class MyFirstFlutter extends StatelessWidget {
  const MyFirstFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//as per the hierarchy class should call material class
      home: MyFirstCode(),);//in which design in scaffold
  }

}

class MyFirstCode extends StatelessWidget {
  const MyFirstCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      // body: Center(
      // child: Text("welcome"), //want widget to display
      body: Center(
        child: Column(
          children: [
            const Text("welcome",style: TextStyle(fontSize: 30),),
            const SizedBox(height: 10,),
            const Text("to vanier"),
            const SizedBox(height: 10,),

            ElevatedButton(onPressed: () {},
                child: const Text("Login")),

             ElevatedButton(onPressed: () {},
                child: const Text("Password")),


          ],
        ),
      ),
    );
  }
}
