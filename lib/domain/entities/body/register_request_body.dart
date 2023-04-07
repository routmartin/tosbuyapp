class RegisterRequestBody {
  final String firstName;
  final String lastName;
  final String phone;
  final String pin;
  final String image;
  final String gender;
  final String dob;

  RegisterRequestBody(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.pin,
      required this.image,
      required this.gender,
      required this.dob});

  toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "pin": pin,
      "image": image,
      "gender": gender,
      "dob": dob,
    };
  }
}
