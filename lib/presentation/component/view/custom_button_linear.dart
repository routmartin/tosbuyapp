import 'package:flutter/material.dart';

import '../../../assets/app_colors.dart';

class CustomButtonLinear extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double? borderSize;
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Function() onPressed;

  const CustomButtonLinear({
    super.key,
    this.width,
    this.height,
    this.borderColor,
    this.borderSize,
    this.borderRadius,
    this.backgroundColor,
    this.padding,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        foregroundColor: AppColors.pink,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        fixedSize: width != null || height != null
            ? Size(width ?? 0, height ?? 0)
            : null,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor != null ? borderColor! : Colors.transparent,
              width: borderSize != null ? borderSize! : 0),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        backgroundColor: backgroundColor,
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
