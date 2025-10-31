import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationDrawer(),
    );
  }
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A drawer is an invisible side screen'),
      ),
      body: Center(
        child: Text('Open to Navigate',style: TextStyle(fontSize:20 ),),
      ),
      drawer: Builder(builder: (context)=>Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(accountName: Text('John Wick'), accountEmail: Text('Johnwick@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text('JW',style: TextStyle(fontSize: 40),),
            ),),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              }
            )
          ],
        ),
      ),

    ),
    )
    ;
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text('Home Page'),
      ),
    );
  }
}
