import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {


  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

    //  theme: ThemeData(primaryColor: Colors.black),
      home: MyLayout(),
    );
  }

}
class  MyLayout extends StatelessWidget {
  const MyLayout ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: const Text('My Application',style: TextStyle(color: Colors.white),
        ),
    systemOverlayStyle: SystemUiOverlayStyle(
     systemNavigationBarColor: Colors.black, // Navigation bar
    statusBarColor: Colors.deepPurple,

    ),
        backgroundColor: Colors.deepPurpleAccent,

      ),
      body: Center(

        child: Row(
            children: [
        Expanded( // Expanded is used to fit the entire column widgets inside the given space
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        const Center(
      // the container provides
        // the space of 8 pixel to the bottom of this text
        child: Text(

          'Bret'
          '\nSincere@april.biz'
          '\n1-770-736-8031 x56442',
          style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 30
          ,color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ),
              const Text('address',style: TextStyle(
                fontSize: 25,color: Colors.red
              ),),
              const Text('Kulas Light    Apt.556,    Gwenborough'

                ,style: TextStyle(color: Colors.black,fontSize: 20),),
              const Text('92998-3874'

                ,style: TextStyle(color: Colors.black,fontSize: 20),),
const Divider(),
             const  Text('company',style: TextStyle(
                  fontSize: 25,color: Colors.red
              ),),
             const  Text('Romaguera-Crona, Multi-layered     client-server'

                ,style: TextStyle(color: Colors.black,fontSize: 19),),
           const    Text('neural-net, harness real-time e-markets'

                ,style: TextStyle(color: Colors.black,fontSize: 19),),
             const  Divider(),
              Center(
child:
              Image.asset('assets/img.png',width:400,height: 400,fit: BoxFit.fill,),
              )
                ],


    ),

    ),
      ],
    ),
    ),

    );
  }
}

