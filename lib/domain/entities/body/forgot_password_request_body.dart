class ForgotPasswordRequestBody {
  final String phone;

  ForgotPasswordRequestBody({required this.phone});

  toJson() {
    return {
      "phone": phone,
    };
  }
}
