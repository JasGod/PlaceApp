import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    this.address,
    @required this.latitude,
    @required this.longitude,
  });
}

class PlaceModel {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  PlaceModel({
    @required this.id,
    @required this.image,
    @required this.location,
    @required this.title,
  });
}
