import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../assets/app_styles.dart';
import '../../presentation/component/view/custom_dialog.dart';
import '../../presentation/component/view/custom_dialog_loading.dart';
import '../delegate/sliver_app_bar_delegate.dart';

export '../../presentation/component/view/custom_dialog.dart';

extension DialogExtension on DialogInterface {
  showDialogLoading({
    bool isBackEnabled = true,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    GlobalKey<NavigatorState>? navigatorKey,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => isBackEnabled,
        child: const CustomDialogLoading(),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      navigatorKey: navigatorKey,
      arguments: arguments,
      transitionDuration: transitionDuration,
      transitionCurve: transitionCurve,
      name: name,
      routeSettings: routeSettings,
    );
  }

  closeDialogLoading() => Get.back();

  showDialogInfo({
    required String title,
    required String content,
    List<ButtonDialogInfo>? actions,
    bool isBackEnabled = true,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    GlobalKey<NavigatorState>? navigatorKey,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => isBackEnabled,
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions ?? [],
        ),
      ),
    );
  }

  showDialogInput({
    required String title,
    required Widget content,
    required List<ButtonDialogInfo> actions,
    bool isBackEnabled = true,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    GlobalKey<NavigatorState>? navigatorKey,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => isBackEnabled,
        child: CupertinoAlertDialog(
          title: Text(title),
          content: content,
          actions: actions,
        ),
      ),
    );
  }

  showDialogBottomSheet({
    required String title,
    required Widget content,
    Function()? onClose,
  }) {
    Get.bottomSheet(
      CustomScrollView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 40.sp,
              maxHeight: 40.sp,
              itemPersistentBuild: (context, shrinkOffset, overlapsContent) =>
                  Container(
                color: kPrimaryContainerWhiteGray(context: context),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16.sp),
                child: Container(
                  height: 6.sp,
                  width: 60.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: kOnPrimaryContainerBlackGray(
                      context: Get.context!,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 16.sp, right: 16.sp, left: 16.sp),
                child: Text(
                  title,
                  style: kTextHeadline3(context: Get.context!),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: content),
        ],
      ),
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: kPrimaryContainerWhiteGray(context: Get.context!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAlias,
    ).whenComplete(
      () => onClose?.call(),
    );
  }

  showSnackbar({required String? message}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 3),
      message: message,
    ));
  }
}
