import 'package:flutter/material.dart';

void main() {
  runApp(const HotelApplication());
}

class HotelApplication extends StatelessWidget {
  const HotelApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHotelLayout(),
    );
  }
}

class MyHotelLayout extends StatefulWidget {
  const MyHotelLayout({super.key});

  @override
  State<MyHotelLayout> createState() => _MyHotelLayoutState();
}

class _MyHotelLayoutState extends State<MyHotelLayout> {
  int counterGuests = 2;
  int counterRooms = 1;

  // instead of VoidCallback, we just say "Function"
  Widget _buildCounterRow(
      String label, int value, Function onAdd, Function onRemove, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text("$value $label"),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          //not full screen
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => onRemove(),
              icon: const Icon(Icons.remove, color: Colors.orange),
            ),
            Container(
              width: 1,
              color: Colors.orange,
              height: 30,
            ),
            IconButton(
              onPressed: () => onAdd(),
              icon: const Icon(Icons.add, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hotels',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back, color: Colors.orange),
      ),
      body: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Las Vegas, NV"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          _buildCounterRow(
            "Guests",
            counterGuests,
                () {
              setState(() {
                counterGuests++;
              });
            },
                () {
              if (counterGuests > 1) {
                setState(() {
                  counterGuests--;
                });
              }
            },
            Icons.people,
          ),
          _buildCounterRow(
            "Room",
            counterRooms,
                () {
              setState(() {
                counterRooms++;
              });
            },
                () {
              if (counterRooms > 1) {
                setState(() {
                  counterRooms--;
                });
              }
            },
            Icons.bed,
          ),
          const ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("Today"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const ListTile(
            leading: Icon(Icons.arrow_left),
            title: Text("Tomorrow"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "you are trying to book $counterGuests guests and $counterRooms rooms",
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Reserve",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
