// location (Admin Portal)
// Datetime selector (Admin Poratl)

// Customer Details (Front End)
// Package Details (Front End)
// Cost
// Duration
// Number of Therapists -> Check how many are required by the package and then assign the number of therapists to the customer.

// Package status (Admin Portal)
// Payment status (Admin Portal)

// Generate payment Link (Admin Portal)

import 'package:elie_web/Database/Packages.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Enquiry.g.dart';

@JsonSerializable()
class Enquiry {
  final String? userName;
  final String? userEmail;
  final String? userPhone;
  final bool? packageStatus;
  final bool? paymentStatus;
  final String? packageId;
  final String? date;
  final String? time;
  final bool isHome;
  final String? location;
  final int? numberOfTherapists;

  Enquiry(
      this.userName,
      this.userEmail,
      this.userPhone,
      this.packageStatus,
      this.paymentStatus,
      this.packageId,
      this.date,
      this.location,
      this.isHome,
      this.numberOfTherapists,
      this.time);

  factory Enquiry.fromJson(Map<String, dynamic> json) =>
      _$EnquiryFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryToJson(this);
}
