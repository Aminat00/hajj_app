// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleGeometry _$GoogleGeometryFromJson(Map<String, dynamic> json) =>
    GoogleGeometry(
      GoogleLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleGeometryToJson(GoogleGeometry instance) =>
    <String, dynamic>{
      'location': instance.location,
    };
