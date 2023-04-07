import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/nav_watch/view/widget/watch_button_play_widget.dart';
import 'package:tostinh/presentation/feature/nav_watch/view/widget/watch_custom_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class WatchControlOverlay extends StatelessWidget {
  const WatchControlOverlay({Key? key, required this.videoPlayerController})
      : super(key: key);
  final VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _playerControl(
            context: context, videoPlayerController: videoPlayerController),
        _watchReact(context: context),
      ],
    );
  }

  Widget _productImageWidget({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          color: kSecondaryContainerBlackGray(context: context),
          borderRadius: BorderRadius.circular(6)),
      height: 60.sp,
      width: 60.sp,
    );
  }

  Widget _productTitleWidget({required BuildContext context}) {
    return Text(
      "The Barista Espresso cambodia",
      style: kTextDescriptionBold(context: context)
          ?.copyWith(color: kOnPrimaryBlack(context: context)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _productPurchaseWidget({required BuildContext context}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "1200 sold",
                      style: kTextHelperNormal2(context: context)?.copyWith(
                          color:
                              kOnPrimaryContainerBlackGray(context: context)),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      "4.8",
                      style: kTextHelperNormal2(context: context)?.copyWith(
                          color:
                              kOnPrimaryContainerBlackGray(context: context)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.sp,
                ),
                Text(
                  "\$1000",
                  style: kTextTitleBold(context: context)
                      ?.copyWith(color: AppColors.red),
                )
              ],
            ),
          ),
          Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: ColorPinkVariant.lightActive,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 36.sp,
                height: 36.sp,
                child: SvgPicture.asset(
                  AppIcons.cartPink,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _interactButtonWidget(
      {required BuildContext context,
      required String appIcon,
      required String title}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 26.sp,
            height: 26.sp,
            child: SvgPicture.asset(
              appIcon,
            ),
          ),
        ),
        Text(
          title,
          style: kTextHelperNormal2(context: context)
              ?.copyWith(color: kPrimaryWhite(context: context)),
        )
      ],
    );
  }

  Widget _followButtonWidget({required BuildContext context}) {
    return SizedBox(
      width: 40.sp,
      height: 40.sp,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 28.sp,
            height: 28.sp,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1.sp)),
            child: SvgPicture.asset(AppIcons.starWhite),
          ),
          Positioned(
            bottom: 0.sp,
            child: SvgPicture.asset(
              AppIcons.follow,
              width: 14.sp,
              height: 14.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget _userShortDetailsProduct({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      alignment: Alignment.center,
      height: 80.sp,
      width: 259.sp,
      decoration: BoxDecoration(
          color: kPrimaryContainerWhiteGray(context: context),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          _productImageWidget(context: context),
          SizedBox(
            width: 10.sp,
          ),
          Expanded(
            child: Column(
              children: [
                _productTitleWidget(context: context),
                _productPurchaseWidget(context: context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _userInteractWidget({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _followButtonWidget(context: context),
        SizedBox(
          height: 20.sp,
        ),
        _interactButtonWidget(
            context: context, appIcon: AppIcons.loveWhite, title: '100'),
        SizedBox(
          height: 20.sp,
        ),
        _interactButtonWidget(
            context: context, appIcon: AppIcons.starWhite, title: '4.5'),
        SizedBox(
          height: 20.sp,
        ),
        _interactButtonWidget(
            context: context, appIcon: AppIcons.shareWhite, title: '120'),
      ],
    );
  }

  Widget _watchReact({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _userShortDetailsProduct(context: context),
              _userInteractWidget(context: context)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.sp),
          margin: EdgeInsets.only(bottom: 15.sp),
          child: SizedBox(
            height: 40.sp,
            child: WatchCustomProgressIndicator(
              videoPlayerController,
              allowScrubbing: true,
            ),
          ),
        )
      ],
    );
  }

  Widget _playerControl(
      {required BuildContext context,
      required VideoPlayerController videoPlayerController}) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: WatchButtonPlayWidget(
            tag: videoPlayerController.dataSource,
            videoPlayerController: videoPlayerController,
          ),
        ),
      ],
    );
  }
}
