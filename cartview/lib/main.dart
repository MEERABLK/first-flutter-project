import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
    ),
  );
  runApp(ContainerProject());
}

class ContainerProject extends StatelessWidget {
  const ContainerProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageContainer(),
    );
  }
}

class ImageContainer extends StatefulWidget {
  const ImageContainer({super.key});

  @override
  State<ImageContainer> createState() => _CounterState();
}

class _CounterState extends State<ImageContainer> {
  // each product has its own counter we have map(array)
  Map<String, int> counters = {
    "Orange": 1,
    "Berry": 1,
    "Grapes": 1,
    "Carrot": 1,
  };

  // prices for subtotal, map(array)
  Map<String, int> prices = {
    "Orange": 300,
    "Berry": 300,
    "Grapes": 50,
    "Carrot": 250,
  };

  //using getter
  int get subtotal {
    int total = 0;

    //for each element(key) in counters
    for (var key in counters.keys) {
      //element at prices array
      var price = prices[key] ?? 0; // null operator if key is null, use 0

      //element at counters array
      var qty = counters[key] ?? 0; // null operator if key is null, use 0
      //multiply price by quantity
      total += price * qty;
    }
    return total;
  }

  int tax(int subtotal) {
    return ((subtotal * 15) / 100).round();
  }

  int cartTotal(int subtotal) {
    return subtotal + tax(subtotal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.grey[850],
          statusBarColor: Colors.grey[850],
        ),

        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 30),
                _tile(
                  "Orange",
                  "Orange - XX Traders",
                  "Rs.300/2kg",
                  "assets/oranges.png",
                ),
                _tile(
                  "Berry",
                  "Berry - WXY Traders",
                  "Rs.300/2kg",
                  "assets/berry.png",
                ),
                _tile(
                  "Grapes",
                  "Grapes - AGR Traders",
                  "Rs.50/2kg",
                  "assets/grapes.png",
                ),
                _tile(
                  "Carrot",
                  "Carrot - GAD Traders",
                  "Rs.250/2kg",
                  "assets/carrots.png",
                ),
              ],
            ),
          ),
          // subtotal checkout button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Subtotal(4 Items)     Rs.$subtotal",
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                ),
                SizedBox(height: 10),
                Text(
                  "Tax     Rs.${tax(subtotal)}",
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                ),

                SizedBox(height: 10),
                Text(
                  "Cart Total     Rs.${cartTotal(subtotal)}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 50, width: 20),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Proceeding to Checkout... "
                            "\nTotal Amount to be Paid is: Rs.${cartTotal(subtotal)}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),

                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      "Secure Checkout",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tile(String key, String title, String subtitle, String path) {
    return ListTile(
      leading: Image.asset(path, fit: BoxFit.cover, width: 65),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: 22,
        ),
      ),

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 5),

          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    //(3??1)-1 = 2 because if it is null then it assigns 1
                    counters[key] = (counters[key] ?? 1) - 1;
                    //to prevent going to 0 if null it assigns 0 and if it is
                    // less than 1 then set value back to 1
                    if ((counters[key] ?? 0) < 1) {
                      // prevent going below 1
                      counters[key] = 1;
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  side: BorderSide(color: Colors.red, width: 4),
                ),
                child: Icon(
                  Icons.remove, // minus icon
                  color: Colors.red,
                  size: 30,
                ),
              ),
              Padding(
                child: Text('${counters[key]}', style: TextStyle(fontSize: 25)),
                padding: EdgeInsets.only(left: 12),
              ),
              SizedBox(width: 12, height: 30),

              OutlinedButton(
                onPressed: () {
                  setState(() {
                    counters[key] = (counters[key] ?? 1) + 1;
                  });
                },

                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  side: BorderSide(color: Colors.red, width: 4),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
