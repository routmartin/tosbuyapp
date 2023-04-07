class WishlistResponses {
  final List<WishlistStores> data;

  WishlistResponses({required this.data});

  factory WishlistResponses.fromJson(Map<String, dynamic> json) {
    return WishlistResponses(
      data: List<WishlistStores>.from(
          json["data"].map((item) => WishlistStores.fromJson(item))),
    );
  }
}

class WishlistStores {
  WishlistStores({
    this.storeId,
    this.storeName,
    this.logo,
    this.product,
  });

  int? storeId;
  String? storeName;
  String? logo;
  List<Product?>? product;

  factory WishlistStores.fromJson(Map<String, dynamic> json) => WishlistStores(
        storeId: json["storeId"],
        storeName: json["storeName"],
        logo: json["logo"],
        product: json["product"] == null
            ? []
            : List<Product?>.from(
                json["product"]!.map((x) => Product.fromJson(x))),
      );
}

class Product {
  Product(
      {this.wishlistId,
      this.productId,
      this.name,
      this.qtyOnHand,
      this.total,
      this.image,
      this.salePrice,
      this.averageRate,
      this.totalRating,
      this.totalSale});

  int? wishlistId;
  int? productId;
  String? name;
  int? qtyOnHand;
  double? total;
  String? image;
  double? salePrice;
  double? averageRate;
  int? totalRating;
  int? totalSale;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        wishlistId: json["wishlistId"],
        productId: json["productId"],
        name: json["name"],
        qtyOnHand: json["qtyOnHand"],
        total: double.parse(json["total"].toString()),
        image: json["image"],
        salePrice: double.parse(json["salePrice"].toString()),
        averageRate: double.parse(json["averageRate"].toString()),
        totalRating: int.parse(json["totalRating"].toString()),
        totalSale: int.parse(json["totalSale"].toString()),
      );
}
