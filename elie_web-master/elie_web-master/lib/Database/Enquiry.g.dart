// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Enquiry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Enquiry _$EnquiryFromJson(Map<String, dynamic> json) => Enquiry(
      json['userName'] as String?,
      json['userEmail'] as String?,
      json['userPhone'] as String?,
      json['packageStatus'] as bool?,
      json['paymentStatus'] as bool?,
      json['packageId'] as String?,
      json['date'] as String?,
      json['location'] as String?,
      json['isHome'] as bool,
      json['numberOfTherapists'] as int?,
      json['time'] as String?,
    );

Map<String, dynamic> _$EnquiryToJson(Enquiry instance) => <String, dynamic>{
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userPhone': instance.userPhone,
      'packageStatus': instance.packageStatus,
      'paymentStatus': instance.paymentStatus,
      'packageId': instance.packageId,
      'date': instance.date,
      'time': instance.time,
      'isHome': instance.isHome,
      'location': instance.location,
      'numberOfTherapists': instance.numberOfTherapists,
    };
