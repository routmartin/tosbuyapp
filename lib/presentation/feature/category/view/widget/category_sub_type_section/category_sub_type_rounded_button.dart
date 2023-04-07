import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';

import '../../../../../../assets/app_styles.dart';

class CategorySubTypeRounedButton extends StatelessWidget {
  final VoidCallback action;
  final bool isActive;
  const CategorySubTypeRounedButton({
    Key? key,
    required this.action,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 12.sp),
      child: Column(
        children: [
          Container(
            height: 60.sp,
            width: 60.sp,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: const CustomCachedImage(
              imageUrl:
                  'https://images.squarespace-cdn.com/content/v1/59b0336be45a7ce9a7143491/1510272559813-3EWUKH31XOKL1Y0PSOPS/Apple+logo+square.png?format=2500w',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.sp),
          Text('Apple', style: kTextHelperNormal1(context: context)),
        ],
      ),
    );
  }
}
