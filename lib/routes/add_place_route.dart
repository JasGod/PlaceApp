import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_app/providers/great_places_provider.dart';
import 'package:provider/provider.dart';

import '../models/place_model.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

class AddPlaceRoute extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceRouteState createState() => _AddPlaceRouteState();
}

class _AddPlaceRouteState extends State<AddPlaceRoute> {
  final _titleController = TextEditingController();
  File _pickedImage;
  PlaceLocation _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(latitude: lat, longitude: lng);
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<GreatPlacesProvider>(context, listen: false)
        .savePlace(_titleController.text, _pickedImage, _pickedLocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: _savePlace,
            style: ElevatedButton.styleFrom(
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Theme.of(context).accentColor),
          ),
        ],
      ),
    );
  }
}