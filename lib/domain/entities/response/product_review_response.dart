import 'meta_response.dart';

class ProductReviewResponse {
  List<ReviewData> data;
  Meta meta;

  ProductReviewResponse({required this.data, required this.meta});

  factory ProductReviewResponse.fromJson(Map<String, dynamic> json) {
    return ProductReviewResponse(
      data: List<ReviewData>.from(
        json["data"].map((item) => ReviewData.fromJson(item)),
      ),
      meta: Meta.fromJson(json["meta"]),
    );
  }
}

class ReviewData {
  final int id;
  final double rating;
  final String description;
  final List<String> media;
  final Customer customer;

  ReviewData({
    required this.id,
    required this.rating,
    required this.description,
    required this.media,
    required this.customer,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      id: json["id"],
      rating: json["rating"],
      description: json["description"],
      media: List<String>.from(json["media"]),
      customer: Customer.fromJson(json["customer"]),
    );
  }
}

class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? image;

  Customer({this.id, this.firstName, this.lastName, this.image});

  Customer.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["firstName"] is String) {
      firstName = json["firstName"];
    }
    if (json["lastName"] is String) {
      lastName = json["lastName"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
  }
}
