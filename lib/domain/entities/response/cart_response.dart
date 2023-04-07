import 'package:tostinh/domain/entities/response/product_detail_response.dart';

class CartResponse {
  final List<Cart> data;
  final CartMeta meta;

  CartResponse({required this.data, required this.meta});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      data: List<Cart>.from(json["data"].map((item) => Cart.fromJson(item))),
      meta: CartMeta.fromJson(json["meta"]),
    );
  }
}

class Cart {
  final int storeId;
  final String storeName;
  final String logo;
  final List<Product> products;

  Cart({
    required this.storeId,
    required this.storeName,
    required this.logo,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      storeId: json["storeId"],
      storeName: json["storeName"],
      logo: json["logo"],
      products: List<Product>.from(
          json["items"].map((item) => Product.fromJson(item))),
    );
  }
}

class Product {
  final String cartId;
  final int productId;
  final String name;
  final String? description;
  final int stockQty;
  int qty;
  final String image;
  final ProductPrice prices;
  final ProductVariant? variants;
  bool? isSelected;

  Product({
    required this.cartId,
    required this.productId,
    required this.name,
    this.description,
    required this.stockQty,
    required this.qty,
    required this.image,
    required this.prices,
    this.variants,
    this.isSelected = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      cartId: json["cartId"],
      productId: json["productId"],
      name: json["name"],
      stockQty: json["stockQty"],
      qty: json["cartQty"],
      image: json["image"],
      prices: ProductPrice.fromJson(json["prices"]),
      variants: json["variant"] != null
          ? ProductVariant.fromJson(json["variant"])
          : null,
    );
  }
}

class ProductVariant {
  final int variantId;
  final String name;
  final String? description;
  final int cartQty;
  final int stockQty;
  final String image;
  final List<ProductOption> options;

  ProductVariant({
    required this.variantId,
    required this.name,
    this.description,
    required this.cartQty,
    required this.stockQty,
    required this.image,
    required this.options,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      variantId: json["variantId"],
      name: json["name"],
      cartQty: json["cartQty"],
      stockQty: json["stockQty"],
      image: json["image"],
      options: List<ProductOption>.from(
        json["options"].map((item) => ProductOption.fromJson(item)),
      ),
    );
  }
}

class ProductOption {
  final String optionName;
  final String optionValue;

  ProductOption({required this.optionName, required this.optionValue});

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      optionName: json["optionName"],
      optionValue: json["optionValue"],
    );
  }
}

class CartMeta {
  final int total;

  CartMeta({required this.total});

  factory CartMeta.fromJson(Map<String, dynamic> json) {
    return CartMeta(total: json["total"]);
  }
}
