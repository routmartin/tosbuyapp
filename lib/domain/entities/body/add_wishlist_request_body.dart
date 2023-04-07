class AddWishlistRequestBody {
  final int productId;

  AddWishlistRequestBody(this.productId);

  toJson() {
    return {
      "productId":productId
    };
  }
}
