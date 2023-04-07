class RefreshTokenResponse {
  final String refreshToken;

  RefreshTokenResponse({required this.refreshToken});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(refreshToken: json['refreshToken']);
  }
}
