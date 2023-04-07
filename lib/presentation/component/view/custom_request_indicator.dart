import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/presentation/component/view/custom_state_failed.dart';
import 'package:tostinh/presentation/component/view/custom_state_no_address.dart';
import 'package:tostinh/presentation/component/view/custom_state_no_cart.dart';
import 'package:tostinh/presentation/component/view/custom_state_no_chat_history.dart';
import 'package:tostinh/presentation/component/view/custom_state_no_data.dart';
import 'package:tostinh/presentation/component/view/custom_state_no_notification.dart';
import 'package:tostinh/presentation/component/view/custom_state_no_purchase.dart';
import 'package:tostinh/presentation/component/view/custom_state_no_result.dart';

import '../../../assets/app_locals.dart';
import '../../../assets/app_styles.dart';
import 'custom_button_linear.dart';
import 'custom_sliver_paging.dart';
import 'custom_state_loading.dart';
import 'custom_state_no_internet.dart';
import 'custom_state_no_related_product.dart';
import 'custom_state_no_wishlist.dart';
import 'custom_state_something_went_wrong.dart';

class CustomRequestIndicator extends StatefulWidget {
  final RequestIndicatorController? controller;
  final Future<RequestIndicatorState> Function() onLoad;
  final Widget child;
  const CustomRequestIndicator(
      {super.key, this.controller, required this.onLoad, required this.child});

  @override
  State<StatefulWidget> createState() => _CustomRequestIndicatorState();
}

class _CustomRequestIndicatorState extends State<CustomRequestIndicator> {
  RequestIndicatorState requestIndicatorStateEnum =
      RequestIndicatorState.loading;
  RequestIndicatorController? get controller => widget.controller;

  Future<void> onTapRetry() async {
    requestIndicatorStateEnum = RequestIndicatorState.loading;
    setState(() {});
    requestIndicatorStateEnum = await widget.onLoad.call();
    setState(() {});
  }

  Future<void> requestData() async {
    controller?.pagingStateListener?.call(PagingState.loading);
    requestIndicatorStateEnum = await widget.onLoad.call();
    setState(() {});
  }

  Future<void> onRefresh() async {
    controller?.limit = 10;
    controller?.offset = 0;
    controller?.pagingStateListener?.call(PagingState.loading);
    requestIndicatorStateEnum = await widget.onLoad.call();
    setState(() {});
  }

  @override
  void initState() {
    if (controller?.isPauseRequest != true) {
      requestData();
    }
    controller?.requestDataListener = requestData;
    controller?.onReload = () => onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContentView();
  }

  Widget _buildContentView() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.red,
      child: _buildValidateState(),
    );
  }

  Widget _buildValidateState() {
    switch (requestIndicatorStateEnum) {
      case RequestIndicatorState.loading:
        return const CustomStateLoading();
      case RequestIndicatorState.success:
        return widget.child;
      case RequestIndicatorState.failed:
        return CustomStateFailed(onTapRetry: onTapRetry);
      case RequestIndicatorState.noData:
        return CustomStateNoData(onTapRetry: onTapRetry);
      case RequestIndicatorState.noRelatedProduct:
        return CustomStateNoRelatedProduct(onTapRetry: onTapRetry);
      case RequestIndicatorState.noInternet:
        return CustomStateNoInternet(onTapRetry: onTapRetry);
      case RequestIndicatorState.somethingWrong:
        return CustomStateSomethingWentWrong(onTapRetry: onTapRetry);
      case RequestIndicatorState.noNotification:
        return const CustomStateNoNotification();
      case RequestIndicatorState.noChatHistory:
        return const CustomStateNoChatHistory();
      case RequestIndicatorState.noCart:
        return CustomStateNoCart(onTapRetry: onTapRetry);
      case RequestIndicatorState.noAddress:
        return const CustomStateNoAddress();
      case RequestIndicatorState.noResult:
        return const CustomStateNoResult();
      case RequestIndicatorState.noPurchase:
        return const CustomStateNoPurchase();
      case RequestIndicatorState.noWishlist:
        return const CustomStateNoWislist();
    }
  }
}

class ComponentStateView extends StatelessWidget {
  final String stateIconPath;
  final String stateHeaderTitle;
  final String stateDesTitle;
  final Function()? onTapRetry;

  const ComponentStateView({
    super.key,
    required this.stateIconPath,
    required this.stateHeaderTitle,
    required this.stateDesTitle,
    required this.onTapRetry,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              stateIconPath,
              width: 260.sp,
              height: 260.sp,
            ),
            SizedBox(
              height: 40.sp,
            ),
            Text(
              stateHeaderTitle,
              style: kTextHeadline2(context: context),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              stateDesTitle,
              style: kTextTitleNormal(context: context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.sp,
            ),
            onTapRetry != null
                ? CustomButtonLinear(
                    onPressed: onTapRetry!,
                    borderColor: kOnPrimaryContainerBlackGray(context: context),
                    borderSize: 1,
                    borderRadius: 30,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: Text(
                        AppLocals.clickToRetry.tr,
                        style: kTextDescriptionNormal(context: context),
                      ),
                    ),
                  )
                : const SizedBox(),
            onTapRetry != null
                ? SizedBox(
                    height: 10.sp,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

enum RequestIndicatorState {
  loading,
  success,
  failed,
  noData,
  noRelatedProduct,
  noInternet,
  noNotification,
  noChatHistory,
  noCart,
  noAddress,
  noResult,
  noWishlist,
  noPurchase,
  somethingWrong,
}

class RequestIndicatorController {
  PagingState pagingStateEnum = PagingState.loading;
  int limit = 10;
  int offset = 0;
  bool isPauseRequest = false;
  Function(PagingState pagingState)? pagingStateListener;
  Function()? onReload;
  Function()? requestDataListener;

  void reload() {
    onReload?.call();
  }
}
