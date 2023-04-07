import 'package:tostinh/domain/entities/response/token_response.dart';

class VerifyOtpResponse {
  final TokenResponse data;

  VerifyOtpResponse(this.data);

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(TokenResponse.fromJson(json["data"]));
  }
}
