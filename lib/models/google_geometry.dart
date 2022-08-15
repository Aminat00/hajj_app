import 'package:hajj_app/models/google_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'google_geometry.g.dart';

@JsonSerializable()
class GoogleGeometry {
  final GoogleLocation location;

  GoogleGeometry(this.location);

  factory GoogleGeometry.fromJson(Map<String, dynamic> json) => _$GoogleGeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleGeometryToJson(this);
}
