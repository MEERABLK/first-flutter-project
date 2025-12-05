import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

// Convert Kelvin to Celsius helper
String kelvinToCelsius(double kelvin) => (kelvin - 273.15).toStringAsFixed(1);

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
      backgroundColor: Colors.lightBlueAccent,
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
              kelvinToCelsius(weatherData!['main']['temp']) + '°C',
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
              'H: ${kelvinToCelsius(weatherData!['main']['temp_max'])}°C   '
                  'L: ${kelvinToCelsius(weatherData!['main']['temp_min'])}°C',
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
                      scrollDirection: Axis.horizontal,
                      children: List.generate(6, (i) {
                        return Padding(
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
                                kelvinToCelsius(weatherData!['main']['temp']) + '°C',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 10-Day Forecast
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
                                  '${kelvinToCelsius(weatherData!['main']['temp_min'])}°C / '
                                      '${kelvinToCelsius(weatherData!['main']['temp_max'])}°C',
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
