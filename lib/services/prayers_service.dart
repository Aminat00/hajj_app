import 'dart:convert';

import 'package:hajj_app/models/hijri_date.dart';
import 'package:hajj_app/models/prayers.dart';
import 'package:http/http.dart' as http;

class PrayersService {
  static Future<Pair?> fetchPair() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity?city=Warsaw&country=Poland&iso8601=true'));
    if (response.statusCode == 200) {
      Map prayersData = jsonDecode(response.body);
      Map<String, dynamic> prayers = prayersData['data']['timings'];
      Map<String, dynamic> hijriDate = prayersData['data']['date']['hijri'];
      final mappedPrayers = Prayers.fromJson(prayers);
      final mappedHijriDate = HijriDate.fromJson(hijriDate);
      final pair = Pair(mappedPrayers, mappedHijriDate);
      return pair;
    } else {
      print("Error with code ${response.statusCode}");
      return null;
    }
  }
}

class Pair {
  final Object item1;
  final Object item2;

  Pair(this.item1, this.item2);
}
