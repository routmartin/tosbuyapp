import 'meta_response.dart';

class StoresResponse {
  final List<Store> data;
  final Meta meta;

  StoresResponse({required this.data, required this.meta});

  factory StoresResponse.fromJson(Map<String, dynamic> json) {
    return StoresResponse(
      data: List<Store>.from(json["data"].map((item) => Store.fromJson(item))),
      meta: Meta.fromJson(json["meta"]),
    );
  }
}

class StoreResponse {
  final Store data;

  StoreResponse({required this.data});

  factory StoreResponse.fromJson(Map<String, dynamic> json) {
    return StoreResponse(data: Store.fromJson(json["data"]));
  }
}

class Store {
  final int id;
  final String cover;
  final String name;
  final String phone;
  final String address;
  final String logo;
  final int totalFollower;
  final int totalReview;
  final double totalRate;
  bool? isFollower;
  final int createdAt;

  Store({
    required this.id,
    required this.cover,
    required this.name,
    required this.phone,
    required this.address,
    required this.logo,
    required this.totalFollower,
    required this.totalReview,
    required this.totalRate,
    this.isFollower,
    required this.createdAt,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json["id"],
      name: json["name"],
      cover: json["cover"],
      phone: json["phone"],
      address: json["address"],
      logo: json["logo"],
      totalFollower: json["totalFollower"],
      totalReview: json["totalReview"],
      totalRate: json["totalRate"],
      isFollower: json["isFollower"] != null ? json["isFollower"] : null,
      createdAt: json["createdAt"],
    );
  }
}
