
import 'package:json_annotation/json_annotation.dart';
part 'umrah.g.dart';

@JsonSerializable()

class Umrah {
  final String? card_title;
  final String? card_text;
  final String? card_img;
  final String? title_no1;
  final String? title_no2;
  final String? title_no3;
  final String? body_text1;
  final String? body_text2;
  final String? img1, img2, img3;
  final String? body_text3;
  final String? list_tile_text;
  final String? arabic_text;
  final String? info_text, info_text2;
  final String? intro_text;
  final String? translation;
  final String? transliteration;
  final String? warning_text, warning_text2;
  final String? point_text, point_text2;
  final String? important_text;


  Umrah(this.card_title, this.card_text, this.card_img, this.title_no1, this.title_no2, this.title_no3,
      this.body_text1, this.body_text2, this.body_text3, this.img1, this.img2, this.img3, this.list_tile_text, this.arabic_text, this.info_text, this.info_text2,
      this.intro_text, this.translation, this.transliteration, this.warning_text,this.warning_text2, this.point_text, this.point_text2, this.important_text);

factory Umrah.fromJson(Map<String, dynamic> json) => _$UmrahFromJson(json);

Map<String, dynamic> toJson() => _$UmrahToJson(this);

}
