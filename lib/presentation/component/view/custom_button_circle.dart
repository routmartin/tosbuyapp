import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_colors.dart';

class CustomButtonCircle extends StatelessWidget {
  final Function() onPressed;
  final double? buttonSize;
  final Color? borderColor;
  final double? borderSize;
  final Color? backgroundColor;
  final Widget child;

  const CustomButtonCircle(
      {super.key,
      required this.onPressed,
      this.buttonSize,
      this.borderColor,
      this.borderSize,
      this.backgroundColor,
      required this.child});

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
        fixedSize: buttonSize != null ? Size(buttonSize!, buttonSize!) : null,
        shape: CircleBorder(
            side: BorderSide(
                color: borderColor != null ? borderColor! : Colors.transparent,
                width: borderSize != null ? borderSize! : 0)),
        backgroundColor: backgroundColor,
      ),
      child: child,
    );
  }
}
