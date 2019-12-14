import 'package:flutter/material.dart';
import 'package:fluttershare/pages/place_list_screen.dart';

AppBar header(context,
    {bool isAppTitle = false, String titleText, removeBackButton = false, addPlaceButton = false}) {
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
      addPlaceButton ?
        IconButton(
          onPressed: () => openPlacesList(context),
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
