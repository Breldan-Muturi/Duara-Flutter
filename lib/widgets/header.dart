import 'package:flutter/material.dart';
import 'package:fluttershare/pages/add_place_screen.dart';
import 'package:fluttershare/pages/place_list_screen.dart';

AppBar header(context,
    {bool isAppTitle = false, String titleText, removeBackButton = false, placeListButton = false, addPlaceButton = false, addProfileButton = false}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(
      isAppTitle ? "FlutterShare" : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: isAppTitle ? "Signatra" : "",
        fontSize: isAppTitle ? 50.0 : 22.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    actions: <Widget>[
      placeListButton ?
        IconButton(
          onPressed: () => openPlacesList(context),
          icon: Icon(Icons.map),
          color: Theme.of(context).primaryColor
        ): Text(''),
      addPlaceButton ?
        IconButton(
          onPressed: () => openAddPlaces(context),
          icon: Icon(Icons.add_location),
          color: Theme.of(context).primaryColor
        ): Text(''),
    ],
    backgroundColor: Theme.of(context).accentColor,
  );
}

  openPlacesList(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlacesListScreen()));
  }

  openAddPlaces(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddPlaceScreen()));
  }

