import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';

import '../../../../../../utils/helper/count_down_helper.dart';

class HomeFlashSaleViewCountDown extends StatefulWidget {
  final HomeController controller;

  const HomeFlashSaleViewCountDown({super.key, required this.controller});
  @override
  State<StatefulWidget> createState() => _HomeFlashSaleViewCountDown();
}

class _HomeFlashSaleViewCountDown extends State<HomeFlashSaleViewCountDown> {
  final _countDownHelper = CountDownHelper();

  int flashSaleCountDown = 0;
  void _startCountDown() {
    _countDownHelper.startCountDownTimer(
      timeInMS: 20000000,
      currentCountDown: (inSeconds) {
        if (mounted) {
          setState(() {
            flashSaleCountDown = inSeconds;
          });
        }
      },
      onFinish: () {},
    );
  }

  @override
  void initState() {
    _startCountDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTitle(context: context),
        const SizedBox(width: 10),
        _buildCountDown(
          context: context,
          totalSeconds: flashSaleCountDown,
        ),
        _buildButtonMore(context: context)
      ],
    );
  }

  Widget _buildCountDown({
    required BuildContext context,
    required int totalSeconds,
  }) {
    String seconds = (totalSeconds % 60).toInt().toString().padLeft(2, '0');
    String minutes =
        ((totalSeconds / 60) % 60).toInt().toString().padLeft(2, '0');
    String hours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    return Wrap(
      children: [
        _buildTextTime(context: context, time: hours),
        _buildTextTime(context: context, time: minutes),
        _buildTextTime(context: context, time: seconds),
      ],
    );
  }

  Widget _buildTextTime({
    required BuildContext context,
    required String time,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.bgCountDown,
          width: 24.sp,
          height: 24.sp,
          fit: BoxFit.contain,
        ),
        Text(
          time,
          style: kTextHelperNormal2(context: context)?.copyWith(
            color: kOnSecondaryWhite(context: context),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle({required BuildContext context}) {
    return SvgPicture.asset(
      AppIcons.flashSale,
      width: 18.sp,
      height: 18.sp,
    );
  }

  Widget _buildButtonMore({required BuildContext context}) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomButtonLinear(
          onPressed: () {},
          borderRadius: 6,
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Text(
              AppLocals.globalSeeMore.tr,
              style: kTextHelperBold1(context: context)
                  ?.copyWith(color: ColorPinkVariant.normal),
            ),
          ),
        ),
      ),
    );
  }
}
