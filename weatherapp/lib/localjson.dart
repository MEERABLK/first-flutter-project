import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}
//TODO:convert kelvin to celsius with 273.15
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalJson(),
    );
  }
}

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  Map<String, dynamic>? weatherData;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('asset/sample.json');
    final data = jsonDecode(response);
    setState(() {
      weatherData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // iPhone weather app blue
      body: weatherData == null
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              weatherData!['name'],
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              // '${(weatherData!['main']['temp']-273.15).toStringAsFixed(0)}'.toString(),

            '${weatherData!['main']['temp']}',
              style: const TextStyle(
                fontSize: 90,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              weatherData!['weather'][0]['main'],
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white70,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'H:${weatherData!['main']['temp_max']}   L:${weatherData!['main']['temp_min']}',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 25),

            // Forecast Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Sunny conditions will continue all day.',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      // to scroll through weathers
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i < 6; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${9 + i} AM',
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 8),
                                const Icon(Icons.wb_sunny, color: Colors.yellowAccent),
                                const SizedBox(height: 8),
                                Text(
                                  '${weatherData!['main']['temp'] + i}°',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 10 Day Forecast
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '10-DAY FORECAST',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ['Today', 'Wed', 'Thu', 'Fri', 'Sat'][index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Icon(Icons.wb_sunny, color: Colors.yellowAccent),
                                SizedBox(width: 120),
                                Text(
                                  '${weatherData!['main']['temp_min'] + index}° / ${weatherData!['main']['temp_max'] + index}°',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
