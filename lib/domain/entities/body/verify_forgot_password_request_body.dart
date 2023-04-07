import 'package:tostinh/base/base_result.dart';
import 'package:tostinh/domain/entities/response/message_response.dart';

class VerifyForgotPasswordRequestBody {
  final String pin;
  final String otpCode;

  VerifyForgotPasswordRequestBody({required this.pin, required this.otpCode});

  toJson() {
    return {
      "pin": pin,
      "otpCode": otpCode,
    };
  }
}
