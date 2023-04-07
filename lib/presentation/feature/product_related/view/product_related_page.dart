import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../assets/app_styles.dart';
import '../controller/product_related_controller.dart';
import 'widget/product_related_app_bar.dart';
import 'widget/product_related_body.dart';

class ProductRelatedPage extends StatelessWidget {
  const ProductRelatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductRelatedController>(
        init: ProductRelatedController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kPrimaryContainerWhiteGray(context: context),
            appBar: const ProductRelatedAppBar(),
            body: ProductRelatedBody(controller: controller),
          );
        });
  }
}
