import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CameraAccess()
    );
  }
}


class CameraAccess extends StatefulWidget {
  const CameraAccess({super.key});

  @override
  State<CameraAccess> createState() => _CameraAccessState();
}

class _CameraAccessState extends State<CameraAccess> {

  File? camerafile;



  @override
  void initState() {
    super.initState();
  }

  Future<void>selectFromCamera()async
  {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if(pickedFile!=null)
      {
        setState(() {
          camerafile=File(pickedFile.path);
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('camera demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: selectFromCamera, child:Text('Select image from camera'),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 200,
            width: 200,
            child: camerafile == null
              ? Center(child: Text('sorry nothing selected'))
        : Image.file(camerafile!),
          ),

        ],
      ),
    );
  }
}
