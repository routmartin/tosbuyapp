
class ProductReviewQuery {
  int? limit;
  int? offset;
  int? productId;

  ProductReviewQuery({this.limit, this.offset, this.productId});

  ProductReviewQuery.fromJson(Map<String, dynamic> json) {
    if(json["limit"] is int) {
      limit = json["limit"];
    }
    if(json["offset"] is int) {
      offset = json["offset"];
    }
    if(json["productId"] is int) {
      productId = json["productId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["limit"] = limit.toString();
    _data["offset"] = offset.toString();
    _data["productId"] = productId.toString();
    return _data;
  }
}