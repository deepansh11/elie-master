import 'package:json_annotation/json_annotation.dart';
part 'Packages.g.dart';

@JsonSerializable()
class Packages {
  final int? id;
  final String? title;
  final int? numberOfTherapists;
  final String? durationRange;
  final String? costRange;
  final String? description;
  final List<String>? images;
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

final dummyJson = [
  {
    'id': 1,
    'title': 'Wedding in your house package',
    'numberOfTherapists': 2,
    'durationRange': '5 hrs / 8 hrs',
    'costRange': '30K for 5hrs , 45K for 8hrs',
    'description':
        'Services would be party makeup, hair styling, foot massage, head neck & shoulder massage, body massage, saree draping, Nail painting',
    'images': ['images/packages/wedding.jpg'],
    'rating': 4.5
  },
  {
    'id': 2,
    'title': 'Hen Party Package',
    'numberOfTherapists': 5,
    'durationRange': '5hrs',
    'costRange': '25K for 5hrs',
    'description':
        'Services would be mani–pedi , gel polish, hair styling , cleanup, detan/ bleach',
    'images': ['images/packages/hen.jpg'],
    'rating': 4.8
  },
  {
    'id': 3,
    'title': 'Kids Birthday party Package',
    'numberOfTherapists': 5,
    'durationRange': '3hrs/ 5hrs',
    'costRange': '20K for 3hrs, 30K for 5hrs',
    'description':
        'Services would be Hairstyling , makeup , nail painting for kids Foot massage for parents',
    'images': ['images/packages/kid.jpg'],
    'rating': 4.6
  },
  {
    'id': 4,
    'title': 'Pre Bridal Package',
    'numberOfTherapists': 2,
    'durationRange': '5hrs',
    'costRange': '21K for 5hrs',
    'description':
        'Services would be Facial, Bleach/ Detan for face , Full body waxing, Brazillian Wax , Hair spa, Pedi – Mani, Gel Nails, Body Polishing',
    'images': ['images/packages/pre-bridal.jpg'],
    'rating': 4.9
  },
];
