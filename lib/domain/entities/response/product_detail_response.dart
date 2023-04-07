class ProductDetailResponse {
  Data data;

  ProductDetailResponse({required this.data});

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailResponse(data: Data.fromJson(json["data"]));
  }
}

class Data {
  final int id;
  final String name;
  final int qtyOnHand;
  final List<String> media;
  final Store store;
  final String stockStatus;
  final double discountPercentage;
  final double totalRating;
  final int totalReview;
  final int minSoQty;
  final int maxSoQty;
  final String sku;
  String? code;
  final String image;
  String? detail;
  final int totalView;
  final int totalSale;
  String? video;
  final ProductReview review;
  String? remark;
  final ProductCategory category;
  final ProductPrice prices;
  final List<ProductOption> options;

  Data({
    required this.id,
    required this.name,
    required this.qtyOnHand,
    required this.media,
    required this.store,
    required this.stockStatus,
    required this.discountPercentage,
    required this.totalRating,
    required this.totalReview,
    required this.minSoQty,
    required this.maxSoQty,
    required this.sku,
    this.code,
    required this.image,
    this.detail,
    required this.totalView,
    required this.totalSale,
    this.video,
    required this.review,
    this.remark,
    required this.category,
    required this.prices,
    required this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      name: json["name"],
      qtyOnHand: json["qtyOnHand"],
      media: List<String>.from(json["media"]),
      store: Store.fromJson(json["store"]),
      stockStatus: json["stockStatus"],
      discountPercentage: json["discountPercentage"],
      totalRating: json["totalRating"],
      totalReview: json["totalReview"],
      minSoQty: json["minSOQty"],
      maxSoQty: json["maxSOQty"],
      sku: json["sku"],
      image: json["image"],
      detail: json["detail"],
      totalView: json["totalView"],
      totalSale: json["totalSale"],
      review: ProductReview.fromJson(json["review"]),
      category: ProductCategory.fromJson(json["category"]),
      prices: ProductPrice.fromJson(json["prices"]),
      options: List<ProductOption>.from(
        json["options"].map((item) => ProductOption.fromJson(item)),
      ),
    );
  }
}

class Store {
  int? id;
  String? logo;
  String? cover;
  String? name;
  String? address;
  String? shippingPolicy;
  String? phone;
  String? description;
  String? email;
  String? returnPolicy;
  bool? approved;
  bool? active;
  dynamic sortOrder;
  int? totalFollower;
  int? totalReview;
  int? totalRate;
  dynamic createdAt;
  int? updatedAt;

  Store({
    this.id,
    this.logo,
    this.cover,
    this.name,
    this.address,
    this.shippingPolicy,
    this.phone,
    this.description,
    this.email,
    this.returnPolicy,
    this.approved,
    this.active,
    this.sortOrder,
    this.totalFollower,
    this.totalReview,
    this.totalRate,
    this.createdAt,
    this.updatedAt,
  });

  Store.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["logo"] is String) {
      logo = json["logo"];
    }
    if (json["cover"] is String) {
      cover = json["cover"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["shippingPolicy"] is String) {
      shippingPolicy = json["shippingPolicy"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["returnPolicy"] is String) {
      returnPolicy = json["returnPolicy"];
    }
    if (json["approved"] is bool) {
      approved = json["approved"];
    }
    if (json["active"] is bool) {
      active = json["active"];
    }
    sortOrder = json["sortOrder"];
    if (json["totalFollower"] is int) {
      totalFollower = json["totalFollower"];
    }
    if (json["totalReview"] is int) {
      totalReview = json["totalReview"];
    }
    if (json["totalRate"] is int) {
      totalRate = json["totalRate"];
    }
    createdAt = json["createdAt"];
    if (json["updatedAt"] is int) {
      updatedAt = json["updatedAt"];
    }
  }
}

class ProductCategory {
  final int id;
  final String name;
  final int mainCategoryId;

  ProductCategory({
    required this.id,
    required this.name,
    required this.mainCategoryId,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json["id"],
      name: json["name"],
      mainCategoryId: json["mainCategoryId"],
    );
  }
}

class ProductReview {
  final int star1;
  final int star2;
  final int star3;
  final int star4;
  final int star5;
  final double totalRating;
  final int totalReviewer;

  ProductReview({
    required this.star1,
    required this.star2,
    required this.star3,
    required this.star4,
    required this.star5,
    required this.totalRating,
    required this.totalReviewer,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) {
    return ProductReview(
      star1: json["star1"],
      star2: json["star2"],
      star3: json["star3"],
      star4: json["star4"],
      star5: json["star5"],
      totalRating: json["totalRating"],
      totalReviewer: json["totalReviewer"],
    );
  }
}

class ProductPrice {
  final double priceBeforeDiscount;
  final double discountPercentage;
  final double discountFixedAmount;
  final double discountAmount;
  final double priceAfterDiscount;

  ProductPrice({
    required this.priceBeforeDiscount,
    required this.discountPercentage,
    required this.discountFixedAmount,
    required this.discountAmount,
    required this.priceAfterDiscount,
  });

  factory ProductPrice.fromJson(Map<String, dynamic> json) {
    return ProductPrice(
      priceBeforeDiscount: json["priceBeforeDiscount"],
      discountPercentage: json["discountPercentage"],
      discountFixedAmount: json["discountFixedAmount"],
      discountAmount: json["discountAmount"],
      priceAfterDiscount: json["priceAfterDiscount"],
    );
  }
}

class ProductOption {
  final int optionId;
  final String optionName;
  final List<ProductOptionValue> optionValue;

  ProductOption({
    required this.optionId,
    required this.optionName,
    required this.optionValue,
  });

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      optionId: json["optionId"],
      optionName: json["optionName"],
      optionValue: List.from(
        json["optionValue"].map((item) => ProductOptionValue.fromJson(item)),
      ),
    );
  }
}

class ProductOptionValue {
  final int optionValueId;
  final String optionValueName;
  bool? isSelected;

  ProductOptionValue({
    required this.optionValueId,
    required this.optionValueName,
    this.isSelected = false,
  });

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) {
    return ProductOptionValue(
      optionValueId: json["optionValueId"],
      optionValueName: json["optionValueName"],
    );
  }
}
