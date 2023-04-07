import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/search_product/controller/search_product_controller.dart';
import 'package:tostinh/presentation/feature/search_product/view/widget/search_product_body.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductController>(
      init: SearchProductController(),
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            body: SafeArea(child: SearchProductBody(controller: controller)),
          ),
        );
      },
    );
  }
}
