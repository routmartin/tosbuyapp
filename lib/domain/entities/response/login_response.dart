import 'package:tostinh/domain/entities/response/token_response.dart';

class LoginResponse {
  TokenResponse? data;
  int status;

  LoginResponse({
    this.data,
    required this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json["status"],
      data: json["data"] == null
          ? null
          : TokenResponse.fromJson(json["data"]),
    );
  }
}
