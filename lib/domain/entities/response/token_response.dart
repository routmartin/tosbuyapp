class TokenResponse {
  final String accessToken;
  final String refreshToken;

  TokenResponse(this.accessToken, this.refreshToken);

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(json["accessToken"], json["refreshToken"]);
  }
}
