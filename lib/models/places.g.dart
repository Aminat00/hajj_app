// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Places _$PlacesFromJson(Map<String, dynamic> json) => Places(
      (json['islamic_sites'] as List<dynamic>)
          .map((e) => PlaceId.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['top_restaurants'] as List<dynamic>)
          .map((e) => PlaceId.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['transportation'] as List<dynamic>)
          .map((e) => PlaceId.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['currency_exchange'] as List<dynamic>)
          .map((e) => PlaceId.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['laundry_service'] as List<dynamic>)
          .map((e) => PlaceId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlacesToJson(Places instance) => <String, dynamic>{
      'islamic_sites': instance.islamicSites,
      'top_restaurants': instance.topRestaurants,
      'transportation': instance.transportation,
      'currency_exchange': instance.currencyExchange,
      'laundry_service': instance.laundryService,
    };
