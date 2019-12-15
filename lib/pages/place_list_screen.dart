import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  final String currentUserId;
  PlacesListScreen({this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Your Places", addPlaceButton: true),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('Got no places yet, start adding some!'),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(
                          greatPlaces.items[i].image,
                        ),
                      ),
                      title: Text(greatPlaces.items[i].title),
                      onTap: () {
                        // Go to detail page ...
                      },
                    ),
              ),
      ),
    );
  }
}