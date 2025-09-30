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
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _navigateSecondscreen(){
    //line extracts the text typed by user
  final String username = _username.text;
  final String password = _password.text;
  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardPage(username:username,password:password)));
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
          controller: _username,
          decoration: InputDecoration(
            labelText: 'username'
          ),
        ),
        SizedBox(height: 20
          ,
        ),

        TextField(
          controller: _password,
          decoration: InputDecoration(
              labelText: 'password'
          ),
          //password different
          obscureText: true,
        ),
        SizedBox(height: 20
          ,
        ),
        ElevatedButton(onPressed: _navigateSecondscreen,
            child: Text('Connect here')),

      ],
    ),),
    );

  }
}
class DashBoardPage extends StatelessWidget {
  final String username;
  final String password;

  DashBoardPage({required this.username,required this.password});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Dashboard',style: TextStyle(color: Colors.grey),
),
),
      body: Center(
        child:Column(
          children: [
            Text('Welcome $username'),
            SizedBox(height: 20,),
            Text('Welcome $password'),

          ],
        )

      ),
    );
  }
}
