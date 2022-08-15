import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/umrah.dart';

class UmrahIhramService{
  static Future<List<Umrah>> fetchUmrah() async{
    List<Umrah> umrahList = [];

    final ref = FirebaseDatabase.instanceFor(
        app:  Firebase.app(),
        databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
        .ref();
    final snapshot = await ref.child('Umrah/Ihram').get();
    if(snapshot.exists){
      final json = jsonEncode(snapshot.value);
      final response = jsonDecode(json);
      if(response is List){
        final json = response as List<Object?>;
        json.forEach((element) {
          umrahList.add(Umrah.fromJson(element as Map <String, dynamic>));
        });
      }
    } else {
      print('No data available');
    }
    return umrahList;
  }
}