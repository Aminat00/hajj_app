// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDescription _$PlaceDescriptionFromJson(Map<String, dynamic> json) =>
    PlaceDescription(
      json['name'] as String,
      _getOpeningHours(json['opening_hours'] as Map<String, dynamic>?),
      (json['rating'] as num?)?.toDouble(),
      _$JsonConverterFromJson<List<dynamic>, String?>(
          json['photos'], const PhotoConverter().fromJson),
      GoogleGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceDescriptionToJson(PlaceDescription instance) =>
    <String, dynamic>{
      'name': instance.name,
      'opening_hours': instance.openingHours,
      'rating': instance.rating,
      'photos': const PhotoConverter().toJson(instance.photoRef),
      'geometry': instance.geometry,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
