import 'package:flutter/material.dart';

void main() {
  runApp(MyFAB());
}

class MyFAB extends StatelessWidget {
  const MyFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFabBtn(),
    );
  }
}
class MyFabBtn extends StatefulWidget {
  const MyFabBtn({super.key});
  @override
  State<MyFabBtn> createState() => _MyFabBtnState();
}
class _MyFabBtnState extends State<MyFabBtn> {
  String _value = '';
  void _onClicked() => setState(() => _value = new DateTime.now().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAB'),
        backgroundColor: Colors.blueAccent,centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        backgroundColor: Colors.red,
        // if you set mini to true then it will make your FAB small
        mini: false,
        child: Icon(Icons.timer),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(_value),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: null,
                  child: Text('Login')),
            DataTable
              (columns: [
              DataColumn(label: Text('Roll number')),
              DataColumn(label: Text('Student firstname')),
              DataColumn(label: Text(' Student latname')),
            ], rows:[
              DataRow(cells: [
                DataCell(Text('101')),
                DataCell(Text('101')),
                DataCell(Text('101')),
              ]),
              DataRow(cells: [
                DataCell(Text('102')),

                DataCell(Text('102')),

                DataCell(Text('102')),
              ])
            ] )
            ],

          ),
        ),
      ),
    );
  }
}
