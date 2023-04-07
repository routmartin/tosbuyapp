import 'dart:ffi';

class VerifyOtpQuery {
  final Int otp;

  VerifyOtpQuery({required this.otp});

  toJson() {
    return {
      "otp": otp.toString(),
    };
  }
}
