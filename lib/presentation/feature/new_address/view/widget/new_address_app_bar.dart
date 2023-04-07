import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_icons.dart';
import '../../../../component/view/custom_app_bar.dart';
import '../../controller/new_address_controller.dart';

class NewAddressAppBar extends StatelessWidget implements PreferredSizeWidget {
  final NewAddressController controller;

  const NewAddressAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Add New Address",
      onTapLeft: () {
        Get.back();
      },
      actions: [
        IconButtonAppBar(
          onPressed: () => controller.getCurrentLocation(),
          child: SvgPicture.asset(
            AppIcons.currentLocation,
            color: AppColors.pink,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
