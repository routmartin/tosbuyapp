import 'dart:io';

class NetworkConnection {
  static final NetworkConnection _internetHelper =
      NetworkConnection._internal();
  factory NetworkConnection() {
    return _internetHelper;
  }
  static Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    {
      return false;
    }
  }

  NetworkConnection._internal();
}
