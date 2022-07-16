import 'package:json_annotation/json_annotation.dart';

part 'Enquiry.g.dart';

@JsonSerializable()
class Enquiry {
  final String? userName;
  final String? userEmail;
  final String? userPhone;
  final bool? packageStatus;
  final bool? paymentStatus;
  final int? package;
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
      this.package,
      this.date,
      this.location,
      this.isHome,
      this.numberOfTherapists,
      this.time);

  factory Enquiry.fromJson(Map<String, dynamic> json) =>
      _$EnquiryFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryToJson(this);
}
