import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:hajj_app/models/place_description.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hajj_app/models/places.dart';

import '../models/place_id.dart';

const String apiKey = 'AIzaSyBUYiQ_4AQKHEbkCBR5_S1xxy67mYpTMzw';

class PlacesService {
  static Future<Uint8List?> getPhoto(String? photoRef) async {
    if (photoRef == null) return null;

    http.Response? response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoRef&key=$apiKey'));
    if (response.statusCode == 200) {
      List<int> list = response.body.codeUnits;
      return Uint8List.fromList(list);
    }
    return null;
  }

  static Future<List<PlaceDescription>> getDescriptions(int tabIndex) async {
    Places? places;
    final ref = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
        .ref();
    final snapshot = await ref.child('Places').get();
    if (snapshot.exists) {
      final json = jsonEncode(snapshot.value);
      final response = jsonDecode(json);
      places = Places.fromJson(response);
    } else {
      debugPrint('No data available.');
    }

    List<PlaceId> placeIds = _getCategory(tabIndex, places);

    List<PlaceDescription> placeDescriptions = [];
    for (PlaceId placeId in placeIds) {
      http.Response response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/place/details/json?fields=name,rating,opening_hours,geometry,photo&key=$apiKey&place_id=${placeId.placeId}'));
      if (response.statusCode == 200) {
        Map prayersData = jsonDecode(response.body);
        Map<String, dynamic> json = prayersData['result'];
        final placeDescription = PlaceDescription.fromJson(json);
        placeDescriptions.add(placeDescription);
      } else {
        debugPrint("Error with code ${response.statusCode}");
      }
    }
    return placeDescriptions;
  }

  static _getCategory(int tabIndex, Places? places) {
    switch (tabIndex) {
      case 0:
        return places!.islamicSites;
      case 1:
        return places!.topRestaurants;
      case 2:
        return places!.transportation;
      case 3:
        return places!.currencyExchange;
      case 4:
        return places!.laundryService;
      default:
        return places!.islamicSites;
    }
  }
}
