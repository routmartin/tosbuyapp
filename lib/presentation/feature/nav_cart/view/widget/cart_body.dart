import 'package:flutter/material.dart';

import '../../controller/cart_controller.dart';
import 'cart_footer_section/cart_footer_section.dart';
import 'cart_list_section/cart_list_section.dart';

class CartBody extends StatelessWidget {
  final CartController controller;

  const CartBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CartListSection(controller: controller)),
        CartFooterSection(controller: controller),
      ],
    );
  }
}
