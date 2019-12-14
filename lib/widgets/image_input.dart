import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage; 

  Future<void> _takePicture() async {
   final imageFile =  await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
      maxWidth: 600,
      );
    setState(() {
      this._storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$filename');

  }

  Future<void> _takeFromGallery() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 600,
      maxWidth: 600,
    );
    setState(() {
      this._storedImage = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
       children: <Widget>[
         GestureDetector(
          onDoubleTap: _takeFromGallery,
          child: Container(           
            width: 120.0,
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: _storedImage != null ? Image.file(
              _storedImage,
              fit:BoxFit.cover,
              width: double.infinity,
              ) 
              : Text('No image available' ,textAlign: TextAlign.center,),
            alignment: Alignment.center,          
           ),
         ),
         SizedBox(width: 10.0,),
         Expanded(
           child: FlatButton.icon(
             icon: Icon(Icons.camera),
             label: Text('Take Picture',),
             textColor: Theme.of(context).primaryColor,
             onPressed: _takePicture,
             ),
           ),
       ],
    );
  }
}