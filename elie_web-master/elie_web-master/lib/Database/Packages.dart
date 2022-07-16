import 'package:json_annotation/json_annotation.dart';
part 'Packages.g.dart';

@JsonSerializable()
class Packages {
  final int? id;
  final String? title;
  final int numberOfTherapists;
  final List<double>? durationRange;
  final List<double>? costRange;
  final String? description;
  final String? images;
  final double rating;

  Packages(
    this.id,
    this.title,
    this.numberOfTherapists,
    this.durationRange,
    this.costRange,
    this.description,
    this.images,
    this.rating,
  );

  factory Packages.fromJson(Map<String, dynamic> json) =>
      _$PackagesFromJson(json);

  Map<String, dynamic> toJson() => _$PackagesToJson(this);
}
