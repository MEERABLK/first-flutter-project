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
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();

  void _navigateSecondscreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(items: _item.text,name: _name.text,phone: _phone.text,),
      ),
    );
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
                  labelText: 'item',
                  border: OutlineInputBorder(),

        ),
            ),
            SizedBox(height: 20
              ,
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                  labelText: 'name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

              TextField(
              controller: _phone,
              decoration: InputDecoration(
                  labelText: 'phone',
                border: OutlineInputBorder(),

              ),
            ),
            SizedBox(height: 20),


            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                      DetailsPage(
                          items: _item.text, name: _name.text, phone: _phone.text),
                ),);
            },
            child: Text('go')),



          ],
        ),
      ),
    );

  }
}
class DetailsPage extends StatelessWidget {
  final String  items,name,phone;

  DetailsPage({required this.items,required this.name,required this.phone });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('name is $name'),
            Text('item is $items'),
            Text('phone is $phone'),
          ],
        ),
      )


    );
  }
}
