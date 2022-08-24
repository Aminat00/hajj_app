import 'package:json_annotation/json_annotation.dart';

part 'dua.g.dart';

@JsonSerializable()
class Dua {
  @JsonKey(ignore: true)
  int? originalIndex;
  final String enName;
  final String name;
  final String reference;
  final String enBody;
  final String body;
  @JsonKey(ignore: true)
  bool favourite;

  Dua(this.enName, this.name, this.reference, this.enBody, this.body, {this.favourite = false});

  factory Dua.fromJson(Map<String, dynamic> json) => _$DuaFromJson(json);

  Map<String, dynamic> toJson() => _$DuaToJson(this);

  changeFavourite() {
    favourite = !favourite;
  }
}
