import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hajj_app/models/umrah_list.dart';
import '../models/umrah.dart';

class UmrahService{
  static Future<UmrahList?> fetchUmrah() async{
    UmrahList? list;

    final ref = FirebaseDatabase.instanceFor(
        app:  Firebase.app(),
        databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
    .ref();
    final snapshot = await ref.child('Umrah').get();

    if(snapshot.exists){
      final json = jsonEncode(snapshot.value);
      final response = jsonDecode(json);
      list = UmrahList.fromJson(response);
      }
     else {
      print('No data available');
    }
     print('got data');
    return list;
  }
}