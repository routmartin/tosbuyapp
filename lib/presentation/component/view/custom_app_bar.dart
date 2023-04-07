import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/presentation/component/view/custom_button_circle.dart';

import '../../../assets/app_styles.dart';
import 'custom_button_linear.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTapLeft;
  final bool? isHideLeading;
  final Widget? leading;
  final String title;
  final Widget? background;
  final double? elevation;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.onTapLeft,
    this.isHideLeading,
    this.leading,
    required this.title,
    this.background,
    this.elevation,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: _validateLeadingWidget(),
      leading: _validateLeading(context: context),
      title: Text(
        title,
        style: kTextHeadline3(context: context),
      ),
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      elevation: elevation ?? 2,
      flexibleSpace: background,
      titleSpacing: 0,
      actions: [
        ...?actions,
        SizedBox(
          width: 16.sp,
        )
      ],
    );
  }

  double _validateLeadingWidget() {
    if (leading != null) {
      return kToolbarHeight + 16.sp;
    } else {
      if (onTapLeft != null) {
        return kToolbarHeight + 16.sp;
      } else {
        return 0;
      }
    }
  }

  Widget _validateLeading({required BuildContext context}) {
    Widget button;
    if (isHideLeading == false || isHideLeading == null) {
      if (onTapLeft != null) {
        button = IconButtonAppBar(
            onPressed: onTapLeft!,
            child: SvgPicture.asset(
              AppIcons.back,
              color: kOnPrimaryContainerBlackGray(context: context),
            ));
      } else {
        if (leading != null) {
          button = leading!;
        } else {
          button = const SizedBox();
        }
      }
    } else {
      button = const SizedBox();
    }
    return Row(
      children: [
        SizedBox(
          width: 16.sp,
        ),
        button,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class IconButtonAppBar extends StatelessWidget {
  const IconButtonAppBar({
    super.key,
    required this.onPressed,
    required this.child,
  });
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomButtonCircle(
      backgroundColor: kPrimaryContainerWhiteGray(context: context),
      onPressed: onPressed,
      buttonSize: kToolbarHeight - 14,
      child: child,
    );
  }
}

class TextButtonAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const TextButtonAppBar({
    super.key,
    required this.onPressed,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomButtonLinear(
        borderRadius: 8,
        backgroundColor: kPrimaryWhite(context: context),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
      ),
    );
  }
}
