class ResultResponse {
  String? message;

  ResultResponse(this.message);

  ResultResponse.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
  }
}
