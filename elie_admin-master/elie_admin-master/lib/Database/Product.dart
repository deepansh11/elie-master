import 'package:flutter/foundation.dart';

class Product {
  Product(
    this.id,
    this.productTitle,
    this.productImage,
    this.productDesc,
    this.regularPrice,
    this.salePrice,
    this.reviewId,
    this.tax,
    this.stock,
    this.lowStockThreshold,
    this.status,
    this.size,
    this.weight,
    this.aff,
    this.sku,
    this.hsn,
  );
  final id;
  final productTitle;
  final productImage;
  final productDesc;
  final regularPrice;
  final salePrice;
  final reviewId;
  final tax;
  final stock;
  final lowStockThreshold;
  final status;
  final size;
  final weight, aff, hsn, sku;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "productTitle": productTitle,
      "productImage": productImage,
      "productDesc": productDesc,
      "regularPrice": regularPrice,
      "salePrice": salePrice,
      "reviewId": reviewId,
      "tax": tax,
      "stock": stock,
      "status": status,
      "lowStockThreshold": lowStockThreshold,
      "size": size,
      "weight": weight,
      "affirmation": aff,
      "hsn": hsn,
      "sku": sku,
    };
  }

  factory Product.fromJson(data) {
    final id = data["id"];
    final productTitle = data["productTitle"];
    final productImage = data["productImage"];
    final productDesc = data["productDesc"];
    final regularPrice = data["regularPrice"];
    final salePrice = int.parse(data["salePrice"].toString()).toDouble();
    final reviewId = data["reviewId"];
    final tax = data["tax"];
    final stock = data["stock"];
    final status = data["status"];
    final lowStockThreshold = data["lowStockThreshold"];
    final size = data["size"];
    final weight = data["weight"];
    final aff = data["affirmation"];
    final hsn = data["hsn"];
    final sku = data["sku"];

    return Product(id, productTitle, productImage, productDesc, regularPrice, salePrice, reviewId, tax, stock, lowStockThreshold, status, size,
        weight, aff, hsn, sku);
  }
}
