import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/presentation/feature/sample/controller/sample_controller.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../component/view/custom_app_bar.dart';

class SampleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SampleController controller;

  const SampleAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: () {},
      title: "AppBar",
      actions: [
        TextButtonAppBar(
          onPressed: () {},
          child: Text(
            "Apply",
            style: kTextTitleNormal(context: context)
                ?.copyWith(color: AppColors.pink),
          ),
        ),
        IconButtonAppBar(
          onPressed: () {},
          child: SvgPicture.asset(AppIcons.locationFill),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
