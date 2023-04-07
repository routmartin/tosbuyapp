import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import '../../../../../../assets/app_styles.dart';

class HomeChoiceViewLayoutButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final int topColor;
  final int bottomColor;
  final VoidCallback onPressed;
  const HomeChoiceViewLayoutButton({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.topColor,
    required this.bottomColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      onPressed: onPressed,
      borderRadius: 6,
      child: Container(
        width: 120.sp,
        height: 50.sp,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(topColor),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(bottomColor),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: kTextHelperBold1(context: context)?.copyWith(
                            color: kOnSecondaryWhite(context: context),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Text(
                          subTitle,
                          style: kTextHelperNormal2(context: context)?.copyWith(
                            color: kOnSecondaryWhite(context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    icon,
                    fit: BoxFit.contain,
                    height: 22.sp,
                    width: 22.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
