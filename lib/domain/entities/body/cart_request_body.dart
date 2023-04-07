class AddCartRequestBody {
  final int productId;
  final int? variantId;
  final int qty;

  AddCartRequestBody({
    required this.productId,
    this.variantId,
    required this.qty,
  });

  toJson() {
    return {
      "productId": productId,
      "variantId": variantId,
      "cartQty": qty,
    };
  }
}

class RemoveCartRequestBody {
  final List<String> id;

  RemoveCartRequestBody({required this.id});

  toJson() {
    return {
      "id": id
    };
  }
}

class UpdateCartRequestBody {
  final String id;
  final int qty;

  UpdateCartRequestBody({required this.id, required this.qty});

  toJson() {
    return {"qty": qty};
  }
}

