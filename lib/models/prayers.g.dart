// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prayers _$PrayersFromJson(Map<String, dynamic> json) => Prayers(
      DateTime.parse(json['Fajr'] as String),
      DateTime.parse(json['Sunrise'] as String),
      DateTime.parse(json['Dhuhr'] as String),
      DateTime.parse(json['Asr'] as String),
      DateTime.parse(json['Sunset'] as String),
      DateTime.parse(json['Maghrib'] as String),
      DateTime.parse(json['Isha'] as String),
      DateTime.parse(json['Imsak'] as String),
      DateTime.parse(json['Midnight'] as String),
      DateTime.parse(json['Firstthird'] as String),
      DateTime.parse(json['Lastthird'] as String),
    );

Map<String, dynamic> _$PrayersToJson(Prayers instance) => <String, dynamic>{
      'Fajr': instance.Fajr.toIso8601String(),
      'Sunrise': instance.Sunrise.toIso8601String(),
      'Dhuhr': instance.Dhuhr.toIso8601String(),
      'Asr': instance.Asr.toIso8601String(),
      'Sunset': instance.Sunset.toIso8601String(),
      'Maghrib': instance.Maghrib.toIso8601String(),
      'Isha': instance.Isha.toIso8601String(),
      'Imsak': instance.Imsak.toIso8601String(),
      'Midnight': instance.Midnight.toIso8601String(),
      'Firstthird': instance.Firstthird.toIso8601String(),
      'Lastthird': instance.Lastthird.toIso8601String(),
    };
