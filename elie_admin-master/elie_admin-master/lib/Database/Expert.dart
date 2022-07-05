class Experts {
  Experts(
    this.name,
    this.sex,
    this.phone,
    this.email,
    this.password,
    this.age,
    this.dob,
    this.averageRating,
    this.reviewId,
    this.availability,
    this.last_location,
    this.status,
    this.totalTips,
    this.totalCommission,
  );
  final name;
  final sex;
  final phone;
  final email;
  final password;
  final age;
  final dob;
  final averageRating;
  final reviewId;
  final availability;
  final last_location;
  final status;
  final totalTips;
  final totalCommission;

  Map<String, dynamic> toJson() {
    // return a map literal with all the non-null key-value pairs
    return {
      'name': name,
      "sex": sex,
      "phone": phone,
      "email": email,
      "password": password,
      "age": age,
      "dob": dob,
      "averageRating": averageRating,
      "reviewId": reviewId,
      "availability": availability,
      "last_location": last_location.toJson(),
      "status": status,
      "totalTips": totalTips,
      "totalCommission": totalCommission,
    };
  }

  factory Experts.fromJson(data) {
    final name = data['name'];
    final sex = data['sex'];
    final phone = data["phone"];
    final email = data["email"];
    final password = data["password"];
    final age = data['age'];
    final dob = data['dob'];
    final averageRating = data['averageRating'];
    final reviewId = data['reviewId'];
    final availability = data['availability'];
    final last_location = (data['last_location']);
    final status = (data['status']);
    final totalTips = data['totalTips'];
    final totalCommission = data['totalCommission'];

    return Experts(
        name,
        sex,
        phone,
        email,
        password,
        age,
        dob,
        averageRating,
        reviewId,
        availability,
        last_location,
        status,
        totalTips,
        totalCommission);
  }
}
