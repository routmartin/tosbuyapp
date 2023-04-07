class AddressResponse {
  List<Address> addresses;

  AddressResponse({required this.addresses});

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      addresses: List<Address>.from(
        json["data"].map((item) => Address.fromJson(item)),
      ),
    );
  }
}

class Address {
  final int id;
  final String houseNo;
  final String street;
  final double lat;
  final double lng;
  final int? countryId;
  final int? provinceId;
  final int? districtId;
  final int? communeId;
  final int? villageId;
  final String? remark;
  final String? label;
  final String addressDetail;
  final bool? isDefault;
  final String? phone;

  Address({
    required this.id,
    required this.houseNo,
    required this.street,
    required this.lat,
    required this.lng,
    this.countryId,
    this.provinceId,
    this.districtId,
    this.communeId,
    this.villageId,
    this.remark,
    this.label,
    required this.addressDetail,
    this.isDefault,
    this.phone,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
      houseNo: json["houseNo"] ?? "",
      street: json["street"] ?? "",
      lat: json["lat"],
      lng: json["lng"],
      remark: json["remark"] ?? "",
      label: json["label"] ?? "",
      addressDetail: json["addressDetail"],
      isDefault: json["default"],
      phone: json["phone"],
    );
  }
}
