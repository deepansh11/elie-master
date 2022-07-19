import 'package:json_annotation/json_annotation.dart';

part 'About.g.dart';

@JsonSerializable()
class About {
  final int? id;
  final String? title;
  final String? subTitle;
  final String? type;
  final String? description;
  final String? images;

  About(this.title, this.id, this.subTitle, this.type, this.description,
      this.images);

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);
}
