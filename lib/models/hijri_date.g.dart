// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hijri_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HijriDate _$HijriDateFromJson(Map<String, dynamic> json) => HijriDate(
      json['day'] as String,
      const MonthConverter().fromJson(json['month'] as Map<String, dynamic>),
      json['year'] as String,
    );

Map<String, dynamic> _$HijriDateToJson(HijriDate instance) => <String, dynamic>{
      'day': instance.day,
      'month': const MonthConverter().toJson(instance.month),
      'year': instance.year,
    };
