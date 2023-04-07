import 'meta_response.dart';
import 'product_detail_response.dart';

class ProductsResponse {
  List<ProductData>? data;
  Meta meta;

  ProductsResponse({required this.data, required this.meta});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      data: List<ProductData>.from(
        json["data"].map((item) => ProductData.fromJson(item)),
      ),
      meta: Meta.fromJson(json["meta"]),
    );
  }
}

class ProductData {
  final int id;
  final String image;
  final String name;
  final int qtyOnHand;
  final String stockStatus;
  final int totalSale;
  final double totalRating;
  final int totalReview;
  final Store store;
  final ProductPrice price;

  ProductData({
    required this.id,
    required this.image,
    required this.name,
    required this.qtyOnHand,
    required this.stockStatus,
    required this.totalSale,
    required this.totalRating,
    required this.totalReview,
    required this.store,
    required this.price,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      qtyOnHand: json["qtyOnHand"],
      stockStatus: json["stockStatus"],
      totalSale: json["totalSale"],
      totalRating: json["totalRating"],
      totalReview: json["totalReview"],
      store: Store.fromJson(json["store"]),
      price: ProductPrice.fromJson(json["prices"]),
    );
  }
}
