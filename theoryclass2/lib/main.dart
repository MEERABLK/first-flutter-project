import 'package:flutter/material.dart';

void main() {
  runApp(ContainerProject());
}

class ContainerProject extends StatelessWidget {
  const ContainerProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageContainer(),
    );
  }
}
class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildImageColumn(),
      ),
    );
  }

  _buildImageColumn() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black
      ),
      child: Column(
        children: [
          _buildImageRow(1),_buildImageRow(3),
          _buildImageRow(5)
        ],
      ),
    );
  }
// in the developer tutorials, you will be given arrow function instead of
  // curly braces, we should embrace this adaptation
  _buildDecoratedRow(int i) =>
      Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 10,color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            margin: EdgeInsets.all(4),
            child: Image.asset('asset/pic$i.jpg'),
          ));

  _buildImageRow(int i) => Row(
    children: [
      _buildDecoratedRow(i),
      _buildDecoratedRow(i + 1),
    ],
  );
}