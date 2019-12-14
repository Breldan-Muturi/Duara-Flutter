import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

class PlacesListScreen extends StatelessWidget {
  final String currentUserId;
  PlacesListScreen({this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Your Places", addPlaceButton: true),
      body: Center(
        child: circularProgress(),
      ),
    );
  }
}