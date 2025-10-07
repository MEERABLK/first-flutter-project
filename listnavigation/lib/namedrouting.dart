import 'package:flutter/material.dart';


void main()
{
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) =>RouteOne(),
        '/detail' : (context)=> RouteTwo(item:'')
    },
    );
  }
}
class RouteOne extends StatelessWidget {
  //const RouteOne({super.key});
 final List list = List.generate(20,(index)=>' item $index');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ListView.builder(itemCount: list.length,itemBuilder: (context,index){
          return ListTile(
            title: Text(list[index]),
            onTap: ()
            {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>RouteTwo(item: list[index])));
             // Navigator.pushNamed(context, '/detail', item: list[index]);
            },
          );
        }),
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {
  final String item;
  RouteTwo({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
    child: Column(
      children: [
        Spacer(),
          Text('you clicked: $item',style: TextStyle(fontSize: 32),),
          ElevatedButton(onPressed :(){
            Navigator.pop(context);
          }, child: Text('go'))


      ],
    ),



      ),
    );
  }
}

