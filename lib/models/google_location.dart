import 'package:json_annotation/json_annotation.dart';

part 'google_location.g.dart';

@JsonSerializable()
class GoogleLocation {
  final double lat;
  final double lng;

  GoogleLocation(this.lat, this.lng);

  factory GoogleLocation.fromJson(Map<String, dynamic> json) => _$GoogleLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleLocationToJson(this);
}
