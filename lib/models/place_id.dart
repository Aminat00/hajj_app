import 'package:json_annotation/json_annotation.dart';

part 'place_id.g.dart';

@JsonSerializable()
class PlaceId {
  @JsonKey(name: 'place_id')
  final String placeId;

  PlaceId(this.placeId);

  factory PlaceId.fromJson(Map<String, dynamic> json) => _$PlaceIdFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceIdToJson(this);
}
