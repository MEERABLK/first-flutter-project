import 'package:flutter/material.dart';

void main() {
  runApp(const MySecondProject());
}

class MySecondProject extends StatelessWidget {
  const MySecondProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyFirstPicture(),
    );
  }
}

class MyFirstPicture extends StatelessWidget {
  const MyFirstPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("BD Card"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('To My Friends', style: TextStyle(fontSize: 25)),
            const SizedBox(height: 10),
            const Text('wed', style: TextStyle(fontSize: 25)),
            const SizedBox(height: 10),

            const Icon(Icons.beach_access, color: Colors.deepOrange, size: 40),
            const Icon(Icons.audiotrack, color: Colors.deepOrange, size: 40),
            const SizedBox(height: 10),

            InkWell(
              onTap: () {
                print("clicked");
              },
              child: Image.asset('assets/ehehe.png', width: 100, height: 100),
            ),

            Image.asset('assets/ehehe.png', width: 100, height: 100),
            Image.asset('assets/ehehe.png', width: 100, height: 100),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/ehehe.png', width: 100, height: 100),
                Image.asset('assets/ehehe.png', width: 100, height: 100),
              ],
            ),

            Container(
              height: 200,
              width: 150,
              color: Colors.amberAccent,
              alignment: Alignment.center,
              child: const Text("this is a container"),
            ),
          ],
        ),
      ),
    );
  }
}
