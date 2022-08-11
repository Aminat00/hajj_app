import 'package:json_annotation/json_annotation.dart';

part 'dua.g.dart';

@JsonSerializable()
class Dua {
  final String enName;
  final String name;
  final String reference;
  final String enBody;
  final String body;

  Dua(this.enName, this.name, this.reference, this.enBody, this.body);

  factory Dua.fromJson(Map<String, dynamic> json) => _$DuaFromJson(json);

  Map<String, dynamic> toJson() => _$DuaToJson(this);
}
