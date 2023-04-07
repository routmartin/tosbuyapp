import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_colors.dart';

class PinCodeActionButton extends StatelessWidget {
  const PinCodeActionButton({
    Key? key,
    required this.actionIcon,
    this.onPressed,
  }) : super(key: key);

  final Widget actionIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: Material(
        child: InkWell(
          splashColor: Colors.pink,
          onTap: onPressed,
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.black,
                width: .8,
              ),
            ),
            alignment: Alignment.center,
            child: actionIcon,
          ),
        ),
      ),
    );
  }
}
