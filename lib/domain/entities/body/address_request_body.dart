class AddressRequestBody {
  final String? houseNo;
  final String? street;
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

  AddressRequestBody({
    this.houseNo,
    this.street,
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

  toJson() {
    return {
      "houseNo": houseNo,
      "street": street,
      "lat": lat,
      "lng": lng,
      "countryId": countryId,
      "provinceId": provinceId,
      "districtId": districtId,
      "communeId": communeId,
      "villageId": villageId,
      "remark": remark,
      "label": label,
      "addressDetail": addressDetail,
      "default": isDefault,
      "phone": phone,
    };
  }
}
