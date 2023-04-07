import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../assets/app_styles.dart';
import '../controller/cart_controller.dart';
import 'widget/cart_app_bar.dart';
import 'widget/cart_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return VisibilityDetector(
          key: const Key("Cart"),
          onVisibilityChanged: controller.onVisibilityChanged,
          child: Scaffold(
            backgroundColor: kPrimaryContainerWhiteGray(context: context),
            appBar: CartAppBar(controller: controller),
            body: CartBody(controller: controller),
          ),
        );
      },
    );
  }
}
