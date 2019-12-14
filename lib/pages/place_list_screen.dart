import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/progress.dart';

class PlacesListScreen extends StatelessWidget {
  final String currentUserId;

  PlacesListScreen({this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your places'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add),
        onPressed: () {},
        ),
      ],
      ),
      body: Center(
        child: circularProgress(),
      ),
    );
  }
}