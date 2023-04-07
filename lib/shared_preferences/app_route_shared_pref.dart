import 'package:get_storage/get_storage.dart';
import 'package:tostinh/assets/app_constants.dart';
import 'package:tostinh/routes/app_routes.dart';

class AppRouteSharedPref {
  final _box = GetStorage();

  String get initialRoute {
    final route = _box.read(AppConstants.keyRoute);
    if (route == null) {
      _box.write(AppConstants.keyRoute, AppRoutes.signIn);
      return AppRoutes.signIn;
    }
    return route;
  }

  set initialRoute(String value) {
    _box.write(AppConstants.keyRoute, value);
  }

  void resetRoute() {
    _box.remove(AppConstants.keyRoute);
  }
}
