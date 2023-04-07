import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_styles.dart';

class CustomButtonCircleShadow extends StatelessWidget {
  const CustomButtonCircleShadow({
    Key? key,
    this.buttonSize,
    this.iconSize,
    required this.child,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  final double? buttonSize;
  final double? iconSize;
  final Widget child;
  final Color? backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: kOnPrimaryBlack(context: context).withOpacity(0.15),
          spreadRadius: 1,
          blurRadius: 10,
        )
      ]),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: ColorPinkVariant.normalActive,
            elevation: 0,
            fixedSize: Size(buttonSize ?? 0, buttonSize ?? 0),
            backgroundColor: backgroundColor,
            shape: const CircleBorder()),
        child: child,
      ),
    );
  }
}
