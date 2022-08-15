import 'package:hajj_app/models/umrah.dart';
import 'package:json_annotation/json_annotation.dart';

part 'umrah_list.g.dart';

@JsonSerializable()
class UmrahList {
  @JsonKey(name: 'Prepare')
  final List<Umrah> prepare;
  @JsonKey(name: 'Ihram')
  final List<Umrah> ihram;
  @JsonKey(name: 'Tawaf_al_Umrah')
  final List<Umrah> tawafAlUmrah;
  @JsonKey(name: 'Sa’i')
  final List<Umrah> sai;
  @JsonKey(name: 'Halq or Taqsir')
  final List<Umrah> halqOrTaqsir;
  @JsonKey(name: 'Mabrook!')
  final List<Umrah> mabrook;

  UmrahList(this.prepare, this.ihram, this.tawafAlUmrah, this.sai, this.mabrook, this.halqOrTaqsir);

  factory UmrahList.fromJson(Map<String, dynamic> json) => _$UmrahListFromJson(json);

  Map<String, dynamic> toJson() => _$UmrahListToJson(this);
}
