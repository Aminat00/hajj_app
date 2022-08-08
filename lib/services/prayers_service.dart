import 'dart:convert';

import 'package:hajj_app/models/prayers.dart';
import 'package:http/http.dart' as http;

class PrayersService {
  static Future<Prayers?> fetchPrayers() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity?city=Warsaw&country=Poland&iso8601=true'));
    if (response.statusCode == 200) {
      Map prayersData = jsonDecode(response.body);
      Map<String, dynamic> prayers = prayersData['data']['timings'];
      final mappedPrayers = Prayers.fromJson(prayers);
      return mappedPrayers;
    } else {
      print("Error with code ${response.statusCode}");
      return null;
    }
  }
}
