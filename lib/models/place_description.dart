import 'package:hajj_app/models/google_geometry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_description.g.dart';

@JsonSerializable()
class PlaceDescription {
  final String name;
  @JsonKey(name: 'opening_hours', fromJson: _getOpeningHours)
  final List<String>? openingHours;
  final double? rating;
  @PhotoConverter()
  @JsonKey(name: 'photos')
  final String? photoRef;
  final GoogleGeometry geometry;

  PlaceDescription(this.name, this.openingHours, this.rating, this.photoRef, this.geometry);

  factory PlaceDescription.fromJson(Map<String, dynamic> json) => _$PlaceDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDescriptionToJson(this);
}

_getOpeningHours(Map<String, dynamic>? json) {
  if (json != null) {
    return List<String>.from(json['weekday_text'].where((text) => text is String));
  }
}

class PhotoConverter extends JsonConverter<String?, List<dynamic>> {
  const PhotoConverter();
  @override
  String? fromJson(json) {
    return json[0]['photo_reference'];
  }

  @override
  toJson(object) {
    return [
      {'photo_reference': object}
    ];
  }
}
