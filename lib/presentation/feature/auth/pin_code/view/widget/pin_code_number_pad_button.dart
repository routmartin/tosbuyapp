import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';

class ButtonOfNumPad extends StatelessWidget {
  const ButtonOfNumPad({
    Key? key,
    required this.num,
    this.onPressed,
  }) : super(key: key);

  final String num;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: Material(
        color: AppColors.whiteGray,
        child: InkWell(
          splashColor: AppColors.pink,
          onTap: onPressed,
          child: Container(
            width: 75,
            height: 75,
            alignment: Alignment.center,
            child: Text(
              num,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 36.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
