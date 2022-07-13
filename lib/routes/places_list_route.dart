import 'package:flutter/material.dart';
import 'package:flutter_native_app/providers/great_places_provider.dart';
import 'package:flutter_native_app/routes/add_place_route.dart';
import 'package:flutter_native_app/routes/places_detail_route.dart';
import 'package:provider/provider.dart';

class PlacesListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceRoute.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlacesProvider>(
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) =>
                    greatPlaces.placeItems.length <= 0
                        ? ch
                        : ListView.builder(
                            itemCount: greatPlaces.placeItems.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlaces.placeItems[i].image,
                                ),
                              ),
                              title: Text(greatPlaces.placeItems[i].title),
                              subtitle: Text(
                                  greatPlaces.placeItems[i].location.address),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  PlaceDetailRoute.routeName,
                                  arguments: greatPlaces.placeItems[i].id,
                                );
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}
