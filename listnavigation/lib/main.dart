import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLoginScreen(),
      theme: ThemeData(),
    );
  }
}
class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final TextEditingController _item = TextEditingController();
final     List<String> _items = [];

  void _navigateSecondscreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(items: _items),
      ),
    );
  }

  void _addItem()
  {
    final String text = _item.text;

    _items.add(text);
    _item.clear();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _item,
              decoration: InputDecoration(
                  labelText: 'item'
              ),
            ),
            SizedBox(height: 20
              ,
            ),


            ElevatedButton(onPressed: _navigateSecondscreen,
                child: Text('show me')),
            ElevatedButton(onPressed: _addItem,
                child: Text('add')),

          ],
        ),
      ),
    );

  }
}
class DetailsPage extends StatelessWidget {
  final List<String> items;

  DetailsPage({required this.items});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',style: TextStyle(color: Colors.grey),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index)
        {
          return ListTile(
            title: Text(items[index]),

          );
        },
      ),




    );
  }
}
