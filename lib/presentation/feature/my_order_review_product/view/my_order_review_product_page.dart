import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/controller/my_order_review_product_controller.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/view/widget/my_order_review_product_app_bar.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/view/widget/my_order_review_product_body.dart';

class MyOrderReviewProductPage extends StatelessWidget {
  const MyOrderReviewProductPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrderReviewProductController>(
      init: MyOrderReviewProductController(),
      builder: (controller) {
        return Scaffold(
          appBar: MyOrderReviewProductAppBar(),
          body: MyOrderReviewProductBody(controller: controller,),
        );
      }
    );
  }
}