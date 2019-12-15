import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage; 

  Future<void> _takePicture() async {
   final imageFile =  await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    
    if (imageFile == null) {
      return;
    }

    setState(() {
     _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$filename');
    widget.onSelectImage(savedImage);
  }

  Future<void> _takeFromGallery() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$filename');
    widget.onSelectImage(savedImage);
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