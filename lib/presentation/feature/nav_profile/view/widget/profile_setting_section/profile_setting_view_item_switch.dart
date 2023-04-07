import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';

class ProfileSettingViewItemSwitch extends StatefulWidget {
  final String title;
  final bool isActive;
  final Function(bool val) onPressed;

  const ProfileSettingViewItemSwitch(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onPressed});
  @override
  State<StatefulWidget> createState() => _ProfileSettingViewItemSwitchState();
}

class _ProfileSettingViewItemSwitchState
    extends State<ProfileSettingViewItemSwitch> {
  bool currentIsActive = false;

  @override
  void initState() {
    currentIsActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      onPressed: () {
        setState(() {
          currentIsActive = !currentIsActive;
        });
        widget.onPressed.call(currentIsActive);
      },
      height: 50.sp,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.sp),
              child: Text(
                widget.title,
                style: kTextDescriptionBold(context: context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 22.sp),
            child: SizedBox(
              height: 35.sp,
              child: FittedBox(
                fit: BoxFit.contain,
                child: CupertinoSwitch(
                  value: currentIsActive,
                  thumbColor: kOnSecondaryWhite(context: context),
                  trackColor: kPrimaryContainerWhiteGray(context: context),
                  activeColor: AppColors.pink,
                  onChanged: (val) {
                    setState(() {
                      currentIsActive = val;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
