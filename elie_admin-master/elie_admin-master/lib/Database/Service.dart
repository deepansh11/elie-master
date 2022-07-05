class Services {
  Services(
    this.id,
    this.name,
    this.image,
    this.desc,
    this.duration,
    this.cost,
    this.saleCost,
    this.reviewId,
    this.tax,
    this.status,
    this.serviceProviderId,
    this.isSpa,
    this.category,
  );
  final id;
  final name;
  final image;
  final desc;
  final duration;
  final cost;
  final saleCost;
  final reviewId;
  final tax;
  final status;
  final serviceProviderId;
  final isSpa, category;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "desc": desc,
      "duration": duration,
      "homeCost": cost,
      "saleCost": saleCost,
      "reviewId": reviewId,
      "tax": tax,
      "status": status,
      "serviceProviderId": serviceProviderId,
      "isSpa": isSpa,
      "category": category,
    };
  }

  factory Services.fromJson(data) {
    final id = data["id"];
    final name = data["name"];
    final image = data["image"];
    final desc = data["desc"];
    final duration = data["duration"];
    final cost = data["homeCost"];
    final saleCost = data["saleCost"];
    final reviewId = data["reviewId"];
    final tax = data["tax"];
    final status = data["status"];
    final serviceProviderId = data["serviceProviderId"];
    final isSpa = data["isSpa"];
    final category = data["category"];

    return Services(id, name, image, desc, duration, cost, saleCost, reviewId, tax, status, serviceProviderId, isSpa, category);
  }
}
