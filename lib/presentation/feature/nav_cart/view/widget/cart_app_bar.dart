import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/nav_cart/controller/cart_controller.dart';

import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_app_bar.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CartController controller;
  const CartAppBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: null,
      title: "${AppLocals.cartTitle.tr} (${controller.totalCart})",
      actions: [
        IconButtonAppBar(
          onPressed: () => controller.confirmRemove(),
          child: SvgPicture.asset(AppIcons.cartTrash),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
