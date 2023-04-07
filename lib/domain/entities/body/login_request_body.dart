class LoginRequestBody {
  String phone;
  String pin;

  LoginRequestBody({required this.phone, required this.pin});

  Map<String, String> toJson() {
    return {
      "phone": phone,
      "pin": pin,
    };
  }
}
