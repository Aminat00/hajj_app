import 'package:json_annotation/json_annotation.dart';
part 'prayers.g.dart';
@JsonSerializable()
class Prayers {
  final DateTime Fajr;
  final DateTime Sunrise;
  final DateTime Dhuhr;
  final DateTime Asr;
  final DateTime Sunset;
  final DateTime Maghrib;
  final DateTime Isha;
  final DateTime Imsak;
  final DateTime Midnight;
  final DateTime Firstthird;
  final DateTime Lastthird;

  Prayers(this.Fajr, this.Sunrise, this.Dhuhr, this.Asr, this.Sunset, this.Maghrib, this.Isha,
      this.Imsak, this.Midnight, this.Firstthird, this.Lastthird);

  factory Prayers.fromJson(Map<String, dynamic> json) => _$PrayersFromJson(json);

  Map<String, dynamic> toJson() => _$PrayersToJson(this);
}
