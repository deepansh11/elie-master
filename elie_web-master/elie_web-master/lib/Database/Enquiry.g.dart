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
      json['package'] == null
          ? null
          : Packages.fromJson(json['package'] as Map<String, dynamic>),
      json['date'] as String?,
      json['location'] as String?,
      json['isHome'] as bool,
      json['numberOfTherapists'] as int?,
      json['time'] as String?,
      (json['totalAmount'] as num?)?.toDouble(),
      (json['paidAmount'] as num?)?.toDouble(),
      (json['balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EnquiryToJson(Enquiry instance) => <String, dynamic>{
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userPhone': instance.userPhone,
      'packageStatus': instance.packageStatus,
      'paymentStatus': instance.paymentStatus,
      'package': instance.package,
      'date': instance.date,
      'time': instance.time,
      'isHome': instance.isHome,
      'location': instance.location,
      'numberOfTherapists': instance.numberOfTherapists,
      'totalAmount': instance.totalAmount,
      'paidAmount': instance.paidAmount,
      'balance': instance.balance,
    };
