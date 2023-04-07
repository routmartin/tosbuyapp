
class ProfileDetailResponse {
  Data? data;

  ProfileDetailResponse({this.data});

  ProfileDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    if(data != null) {
      dataMap["data"] = data?.toJson();
    }
    return dataMap;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? phone;
  String? gender;
  int? dob;
  String? email;
  dynamic customerGroup;
  dynamic remark;
  int? createdAt;

  Data({this.id, this.firstName, this.lastName, this.image, this.phone, this.gender, this.dob, this.email, this.customerGroup, this.remark, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    image = json["image"];
    phone = json["phone"];
    gender = json["gender"];
    dob = json["dob"];
    email = json["email"];
    customerGroup = json["customerGroup"];
    remark = json["remark"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap["id"] = id;
    dataMap["firstName"] = firstName;
    dataMap["lastName"] = lastName;
    dataMap["image"] = image;
    dataMap["phone"] = phone;
    dataMap["gender"] = gender;
    dataMap["dob"] = dob;
    dataMap["email"] = email;
    dataMap["customerGroup"] = customerGroup;
    dataMap["remark"] = remark;
    dataMap["createdAt"] = createdAt;
    return dataMap;
  }
}