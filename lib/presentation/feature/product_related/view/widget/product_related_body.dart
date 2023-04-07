import 'package:flutter/material.dart';

import '../../controller/product_related_controller.dart';
import 'product_related_list_section/product_related_list_section.dart';


class ProductRelatedBody extends StatelessWidget {
  final ProductRelatedController controller;
  const ProductRelatedBody({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductRelatedListSection(controller: controller);
  }
}
