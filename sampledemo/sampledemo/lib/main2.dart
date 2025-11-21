import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notification service
  await NotificationsService().initNotification();

  runApp(const MyApp3());
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController notifTitle = TextEditingController();
  TextEditingController notifDesc = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Time zone initialization here as you wanted
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title Field
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: notifTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Notification Title',
                ),
              ),
            ),

            // Description Field
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: notifDesc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Details',
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                NotificationsService().showNotification(
                  1,
                  notifTitle.text,
                  notifDesc.text,
                );
              },
              child: const Text('Notify'),
            ),
          ],
        ),
      ),
    );
  }
}
