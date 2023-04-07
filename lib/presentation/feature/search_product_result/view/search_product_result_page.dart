import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/search_product_result/controller/search_product_result_controller.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_body.dart';

class SearchProductResultPage extends StatelessWidget {
  const SearchProductResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductResultController>(
      init: SearchProductResultController(),
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          child: Scaffold(
            body: SafeArea(
              child: SearchProductResultBody(
                controller: controller,
              ),
            ),
          ),
        );
      },
    );
  }
}
