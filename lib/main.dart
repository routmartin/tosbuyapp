import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tostinh/assets/app_themes.dart';
import 'package:tostinh/routes/app_pages.dart';
import 'package:tostinh/shared_preferences/app_route_shared_pref.dart';

import 'assets/app_translations.dart';
import 'firebase_options.dart';
import 'main_binding.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: AppThemes.themeMode(),
            locale: const Locale("en_US", "km_KH"),
            translations: AppTranslations(),
            fallbackLocale: const Locale("en_US"),
            initialBinding: MainBinding(),
            getPages: AppPages.routes,
            initialRoute: AppRouteSharedPref().initialRoute,
          );
        });
  }
}
