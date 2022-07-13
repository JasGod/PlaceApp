import 'package:flutter/material.dart';
import 'package:flutter_native_app/providers/great_places_provider.dart';
import 'package:flutter_native_app/routes/places_detail_route.dart';
import 'package:flutter_native_app/routes/places_list_route.dart';

import 'package:provider/provider.dart';

import 'routes/add_place_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlacesProvider(),
      child: MaterialApp(
          title: 'Great Places',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: PlacesListRoute(),
          routes: {
            AddPlaceRoute.routeName: (ctx) => AddPlaceRoute(),
            PlaceDetailRoute.routeName: (ctx) => PlaceDetailRoute(),
          }),
    );
  }
}
