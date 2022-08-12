import 'package:hajj_app/models/place_id.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places.g.dart';

@JsonSerializable()
class Places {
  @JsonKey(name: 'islamic_sites')
  List<PlaceId> islamicSites;
  @JsonKey(name: 'top_restaurants')
  List<PlaceId> topRestaurants;
  List<PlaceId> transportation;
  @JsonKey(name: 'currency_exchange')
  List<PlaceId> currencyExchange;
  @JsonKey(name: 'laundry_service')
  List<PlaceId> laundryService;

  Places(this.islamicSites, this.topRestaurants, this.transportation, this.currencyExchange,
      this.laundryService);

  factory Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesToJson(this);
}
