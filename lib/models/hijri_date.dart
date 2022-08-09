import 'package:json_annotation/json_annotation.dart';

part 'hijri_date.g.dart';

@JsonSerializable()
class HijriDate {
  final String day;
  @MonthConverter()
  final String month;
  final String year;

  HijriDate(this.day, this.month, this.year);

  factory HijriDate.fromJson(Map<String, dynamic> json) => _$HijriDateFromJson(json);

  Map<String, dynamic> toJson() => _$HijriDateToJson(this);
}

class MonthConverter extends JsonConverter<String, Map<String, dynamic>> {
  const MonthConverter();
  @override
  String fromJson(json) {
    return json['en'];
  }

  @override
  toJson(object) {
    return {'month': object};
  }
}
