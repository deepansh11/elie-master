// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Packages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Packages _$PackagesFromJson(Map<String, dynamic> json) => Packages(
      json['id'] as int?,
      json['title'] as String?,
      json['numberOfTherapists'] as int?,
      (json['durationRange'] as List<dynamic>?)?.map((e) => e as int).toList(),
      (json['costRange'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      json['description'] as String?,
      json['images'] as String?,
      (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$PackagesToJson(Packages instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'numberOfTherapists': instance.numberOfTherapists,
      'durationRange': instance.durationRange,
      'costRange': instance.costRange,
      'description': instance.description,
      'images': instance.images,
      'rating': instance.rating,
    };
