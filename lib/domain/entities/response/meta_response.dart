class Meta {
  final int limit;
  final int offset;
  final int total;

  Meta({
    required this.limit,
    required this.offset,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      limit: json["limit"],
      offset: json["offset"],
      total: json["total"],
    );
  }
}
