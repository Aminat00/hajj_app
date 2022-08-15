// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'umrah_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UmrahList _$UmrahListFromJson(Map<String, dynamic> json) => UmrahList(
      (json['Prepare'] as List<dynamic>)
          .map((e) => Umrah.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Ihram'] as List<dynamic>)
          .map((e) => Umrah.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Tawaf_al_Umrah'] as List<dynamic>)
          .map((e) => Umrah.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Sa’i'] as List<dynamic>)
          .map((e) => Umrah.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Mabrook!'] as List<dynamic>)
          .map((e) => Umrah.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Halq or Taqsir'] as List<dynamic>)
          .map((e) => Umrah.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UmrahListToJson(UmrahList instance) => <String, dynamic>{
      'Prepare': instance.prepare,
      'Ihram': instance.ihram,
      'Tawaf_al_Umrah': instance.tawafAlUmrah,
      'Sa’i': instance.sai,
      'Halq or Taqsir': instance.halqOrTaqsir,
      'Mabrook!': instance.mabrook,
    };
