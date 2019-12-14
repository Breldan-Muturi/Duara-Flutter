import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  final String currentUserId;
  AddPlaceScreen({this.currentUserId});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText:"Add a new Place" ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  SizedBox(height: 10.0,),
                  ImageInput(),
                ],
                ),
            ),
          ),
          ),
        RaisedButton.icon(
              label: Text(
                'Add Place',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.blue,
              onPressed: () {},
              icon: Icon(
                Icons.my_location,
                color: Colors.white,
              ),
      ),
      ],
    ),
  );
  }
}