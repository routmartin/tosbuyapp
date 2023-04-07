class ErrorResponse {
  int? status;
  String? message;
  String? timestamp;
  List<Errors>? errors;

  ErrorResponse({this.status, this.message, this.timestamp, this.errors});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
    if (json["errors"] is List) {
      errors = json["errors"] == null
          ? null
          : (json["errors"] as List).map((e) => Errors.fromJson(e)).toList();
    }
  }
}

class Errors {
  String? field;
  String? message;

  Errors({this.field, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    if (json["field"] is String) {
      field = json["field"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }
}
