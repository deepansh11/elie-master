// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'About.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) => About(
      json['title'] as String?,
      json['id'] as int?,
      json['subTitle'] as String?,
      json['type'] as String?,
      json['description'] as String?,
      json['images'] as String?,
    );

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'type': instance.type,
      'description': instance.description,
      'images': instance.images,
    };
