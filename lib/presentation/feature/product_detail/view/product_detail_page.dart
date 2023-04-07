import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';

import '../controller/product_detail_controller.dart';
import 'widget/product_detail_body.dart';
import 'widget/product_detail_order_section/product_detail_order_section.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      init: ProductDetailController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryWhite(context: context),
        body: Column(
          children: [
            Expanded(child: ProductDetailBody(controller: controller)),
            ProductDetailOrderSection(
              controller: controller,
              productDetail: controller.productDetail?.data,
            )
          ],
        ),
      ),
    );
  }
}
