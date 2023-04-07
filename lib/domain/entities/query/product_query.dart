class ProductQuery {
  String? query;
  int? salePrice;
  int? subCategoryId;
  int? categoryId;
  bool? promotion;
  int? brandId;
  int? storeId;
  String? startDate;
  String? endDate;
  int? totalSale;
  int? excludeProductId;
  int limit;
  int offset;

  ProductQuery({
    this.query,
    this.salePrice,
    this.subCategoryId,
    this.categoryId,
    this.promotion,
    this.brandId,
    this.storeId,
    this.startDate,
    this.endDate,
    this.totalSale,
    this.excludeProductId,
    required this.limit,
    required this.offset,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (query != null) {
      data["query"] = query.toString();
    }
    if (salePrice != null) {
      data["salePrice"] = salePrice.toString();
    }
    if (subCategoryId != null) {
      data["subCategoryId"] = subCategoryId.toString();
    }
    if (categoryId != null) {
      data["categoryId"] = categoryId.toString();
    }
    if (promotion != null) {
      data["promotion"] = promotion.toString();
    }
    if (brandId != null) {
      data["brandId"] = brandId.toString();
    }
    if (storeId != null) {
      data["storeId"] = storeId.toString();
    }
    if (startDate != null) {
      data["startDate"] = startDate.toString();
    }
    if (endDate != null) {
      data["endDate"] = endDate.toString();
    }
    if (totalSale != null) {
      data["totalSale"] = totalSale.toString();
    }
    if (excludeProductId != null) {
      data["excludeProductId"] = excludeProductId.toString();
    }
    data["limit"] = limit.toString();
    data["offset"] = offset.toString();
    return data;
  }
}
