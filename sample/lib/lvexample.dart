import 'package:flutter/material.dart';

void main() {
  runApp(const MyLvExample());
}

class MyLvExample extends StatelessWidget {
  const MyLvExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruits List'),
        ),
        body: ListView(
          children: const [
            ListTile(
              leading: Image(
                image: AssetImage('assets/ehehe.png'),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text('Apple'),
              subtitle: Text('Red and sweet'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/ehehe.png'),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text('Banana'),
              subtitle: Text('Yellow and soft'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/ehehe.png'),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text('Orange'),
              subtitle: Text('Juicy and citrusy'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/ehehe.png'),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text('Grapes'),
              subtitle: Text('Small and sweet'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
