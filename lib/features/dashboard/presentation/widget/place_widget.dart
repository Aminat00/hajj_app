import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/other/maps_sheet.dart';
import 'package:hajj_app/models/place_description.dart';
import 'package:hajj_app/services/places_service.dart';
import 'package:map_launcher/map_launcher.dart';

class PlaceWidget extends StatefulWidget {
  final PlaceDescription place;

  const PlaceWidget(
    this.place, {
    Key? key,
  }) : super(key: key);

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  late Future<Uint8List?> _futurePhoto;

  PlaceDescription get place => widget.place;

  @override
  void initState() {
    _futurePhoto = PlacesService.getPhoto(place.photoRef);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image(),
            if (place.rating != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.star),
                    Text(place.rating.toString()),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                place.openingHours?[DateTime.now().weekday - 1] ??
                    'No information about opening hours',
                textAlign: TextAlign.start,
              ),
            ),
            _buttonRow(),
          ],
        ),
      ),
    );
  }

  _image() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 32,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: FutureBuilder(
            future: _futurePhoto,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Icon(Icons.image_not_supported_outlined);
              } else if (snapshot.hasData) {
                return ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.black38,
                      BlendMode.colorBurn,
                    ),
                    child: Image.memory(
                      snapshot.data as Uint8List,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else {
                return const Icon(Icons.image_not_supported_outlined);
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            place.name,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  _buttonRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
              onPressed: () {
                MapsSheet.show(
                  context: context,
                  onMapTap: (map) {
                    map
                        .showDirections(
                            destination:
                                Coords(place.geometry.location.lat, place.geometry.location.lng))
                        .then((value) => Navigator.pop(context));
                  },
                );
              },
              icon: const Icon(Icons.directions),
              label: const Text(
                'Directions',
                textScaleFactor: 1.2,
              )),
          OutlinedButton.icon(
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.teal)),
            onPressed: () {
              MapsSheet.show(
                context: context,
                onMapTap: (map) {
                  map
                      .showMarker(
                          coords: Coords(place.geometry.location.lat, place.geometry.location.lng),
                          title: place.name)
                      .then((value) => Navigator.pop(context));
                },
              );
            },
            icon: const Icon(Icons.near_me),
            label: const Text(
              'Show on map',
              textScaleFactor: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
