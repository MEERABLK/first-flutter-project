import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraAccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraAccess extends StatefulWidget {
  const CameraAccess({super.key});

  @override
  State<CameraAccess> createState() => _CameraAccessState();
}

class _CameraAccessState extends State<CameraAccess> {

  File? cameraFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> selectFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await
    imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        cameraFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: selectFromCamera,
                child: Text(' Select Image from Camera')),
          SizedBox(height: 10,),
            SizedBox(
              height: 200.0,
              width: 300.0,
              child: cameraFile == null
               ? Center (child: Text('Sorry Nothing selected'))
              : Image.file(cameraFile!),
            )
          ],
        ),
      ),
    );
  }
}
