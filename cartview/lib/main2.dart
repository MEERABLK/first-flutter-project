import 'package:flutter/material.dart';

void main() {
  runApp(MyApartment());
}

class MyApartment extends StatelessWidget {
  const MyApartment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySwissTrip(),
      theme: ThemeData.dark(),
    );
  }
}

class MySwissTrip extends StatelessWidget {
  const MySwissTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: ListView(
        children: [
          Image.asset('assets/pic1.png', width: 600, height: 240),
          Padding(
            padding: EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  // Expanded is used to fit the entire column widgets inside the given space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Chill Apartment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 80)),
                            Text(
                              'Katowice',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey, thickness: 2, height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            "350 \$ ",
                            style: TextStyle(
                              color: Colors.deepPurple[800],
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "per night ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Padding(padding: EdgeInsets.only(left: 90)),
                          Icon(Icons.star, color: Colors.white),
                          Text('4.0/5', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Image.asset(
                            'assets/pic2.png',
                            width: 600,
                            height: 240,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Luxury Katowice Hotel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 50)),
                          Text(
                            'Katowice',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey, thickness: 2, height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
