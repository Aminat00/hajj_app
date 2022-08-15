import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:hajj_app/models/dua.dart';
import 'package:http/http.dart' as http;

class QuranService {
  static Future<List<Dua>> fetchDuas() async {
    List<Dua> duasList = [];
    final ref = FirebaseDatabase.instanceFor(
              app: Firebase.app(),
              databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
        .ref();
    final snapshot = await ref.child('Duas/Other').get();
    if (snapshot.exists) {
      final json = jsonEncode(snapshot.value);
      final response = jsonDecode(json);
      if (response is List) {
        final json = response as List<Object?>;
        json.forEach((element) {
          duasList.add(Dua.fromJson(element as Map<String, dynamic>));
        });
      }
    } else {
      print('No data available.');
    }

    return duasList;
  }
}
