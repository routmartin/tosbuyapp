class PaymentMethodResponse {
  final List<PaymentMethod> payments;

  PaymentMethodResponse({required this.payments});

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) {
    return PaymentMethodResponse(
      payments: List<PaymentMethod>.from(
        json["data"].map((item) => PaymentMethod.fromJson(item)),
      ),
    );
  }
}

class PaymentMethod {
  final int id;
  final String code;
  final String name;
  final String remark;
  final String? image;
  final bool active;

  PaymentMethod({
    required this.id,
    required this.code,
    required this.name,
    required this.remark,
    this.image,
    required this.active,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json["id"],
      code: json["code"],
      name: json["name"],
      remark: json["remark"],
      image: json["image"] ?? "",
      active: json["active"],
    );
  }
}
