
import 'package:flutter/material.dart';

void main() {
runApp(MaterialApp(
debugShowCheckedModeBanner: false,
home: FakeStripePaymentDemo(),
));
}

class FakeStripePaymentDemo extends StatefulWidget {
@override
_FakeStripePaymentDemoState createState() => _FakeStripePaymentDemoState();
}

class _FakeStripePaymentDemoState extends State<FakeStripePaymentDemo> {
final cardNumber = TextEditingController();
final expiry = TextEditingController();
final cvv = TextEditingController();

bool isLoading = false;

void processPayment() async {
if (cardNumber.text.isEmpty ||
expiry.text.isEmpty ||
cvv.text.isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Please fill in all fields")),
);
return;
}

setState(() => isLoading = true);

await Future.delayed(Duration(seconds: 2)); // fake processing delay

setState(() => isLoading = false);

Navigator.push(
context,
MaterialPageRoute(
builder: (_) => PaymentSuccessScreen(),
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("Stripe Payment Demo "),
backgroundColor: Colors.deepPurple,
),
body: Padding(
padding: const EdgeInsets.all(20),
child: Column(
children: [
TextField(
controller: cardNumber,
decoration: InputDecoration(
labelText: "Card Number",
hintText: "4242 4242 4242 4242",
border: OutlineInputBorder(),
),
keyboardType: TextInputType.number,
),
SizedBox(height: 15),
Row(
children: [
Expanded(
child: TextField(
controller: expiry,
decoration: InputDecoration(
labelText: "Expiry (MM/YY)",
hintText: "12/30",
border: OutlineInputBorder(),
),
keyboardType: TextInputType.datetime,
),
),
SizedBox(width: 10),
Expanded(
child: TextField(
controller: cvv,
decoration: InputDecoration(
labelText: "CVV",
hintText: "123",
border: OutlineInputBorder(),
),
keyboardType: TextInputType.number,
),
),
],
),
SizedBox(height: 30),
isLoading
? CircularProgressIndicator()
    : ElevatedButton(
style: ElevatedButton.styleFrom(

padding: EdgeInsets.symmetric(
vertical: 15, horizontal: 40),
),
onPressed: processPayment,
child: Text(
"Pay \$10.00",
style: TextStyle(fontSize: 18),
),
),
],
),
),
);
}
}

class PaymentSuccessScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.green.shade50,
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.check_circle,
color: Colors.green, size: 80),
SizedBox(height: 20),
Text(
"Payment Successful!",
style: TextStyle(
fontSize: 26,
fontWeight: FontWeight.bold,
color: Colors.green,
),
),
SizedBox(height: 10),


ElevatedButton(
onPressed: () {
Navigator.pop(context);
},
child: Text("Back"),
)
],
),
),
);
}
}

