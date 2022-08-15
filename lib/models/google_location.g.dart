// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLocation _$GoogleLocationFromJson(Map<String, dynamic> json) =>
    GoogleLocation(
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$GoogleLocationToJson(GoogleLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
