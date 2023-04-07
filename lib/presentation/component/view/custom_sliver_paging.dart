import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/component/view/custom_state_end_failed.dart';
import 'package:tostinh/presentation/component/view/custom_state_end_loading.dart';
import 'package:tostinh/presentation/component/view/custom_state_end_no_internet.dart';
import 'package:tostinh/presentation/component/view/custom_state_end_no_more_data.dart';
import 'package:tostinh/presentation/component/view/custom_state_end_something_wrong.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../assets/app_locals.dart';
import '../../../assets/app_styles.dart';
import 'custom_button_linear.dart';

class CustomSliverPaging extends StatefulWidget {
  final RequestIndicatorController controller;
  final Future<PagingState> Function() onLoadMore;

  const CustomSliverPaging({
    super.key,
    required this.controller,
    required this.onLoadMore,
  });

  @override
  State<StatefulWidget> createState() => _CustomSliverPagingState();
}

class _CustomSliverPagingState extends State<CustomSliverPaging> {
  var isLoading = false;
  var isFailed = false;
  var keyLoading = UniqueKey();
  RequestIndicatorController? get controller => widget.controller;
  PagingState pagingState = PagingState.loading;
  void retry() {
    setState(() {
      pagingState = PagingState.loading;
    });
    isLoading = false;
    requestData();
  }

  Future<void> requestData() async {
    if (isLoading) return;
    isLoading = true;
    controller?.offset += controller!.limit;
    pagingState = await widget.onLoadMore.call();
    isLoading = false;
    if (pagingState != PagingState.success) {
      isFailed = true;
      controller?.offset -= controller!.limit;
    }
    setState(() {});
  }

  @override
  void initState() {
    controller?.pagingStateListener = (pagingState) {
      this.pagingState = pagingState;
      if (this.pagingState == PagingState.loading) {
        isFailed = false;
        keyLoading = UniqueKey();
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: VisibilityDetector(
        key: keyLoading,
        onVisibilityChanged: (VisibilityInfo info) async {
          if (isLoading == false && isFailed == false) {
            if (info.visibleFraction > 0) {
              requestData();
            }
          }
        },
        child: _buildRequestedTrue(),
      ),
    );
  }

  Widget _buildRequestedTrue() {
    switch (pagingState) {
      case PagingState.loading:
        return const CustomStateEndLoading();
      case PagingState.success:
        return const CustomStateEndLoading();
      case PagingState.noInternet:
        return CustomStateEndNoInternet(onTapRetry: () {
          retry();
        });
      case PagingState.failed:
        return CustomStateEndFailed(onTapRetry: () {
          retry();
        });
      case PagingState.somethingWrong:
        return CustomStateEndSomethingWrong(onTapRetry: () {
          retry();
        });
      case PagingState.noMoreData:
        return const CustomStateEndNoMoreData();
    }
  }
}

class ComponentPagingStateView extends StatelessWidget {
  final String stateTitle;
  final Function()? onTapRetry;
  const ComponentPagingStateView(
      {super.key, required this.stateTitle, required this.onTapRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.sp,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stateTitle,
            style: kTextTitleNormal(context: context),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 10.sp,
          ),
          onTapRetry != null
              ? CustomButtonLinear(
                  onPressed: onTapRetry!,
                  borderColor: kOnPrimaryContainerBlackGray(context: context),
                  borderSize: 1,
                  borderRadius: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.sp, vertical: 10.sp),
                    child: Text(
                      AppLocals.clickToRetry.tr,
                      style: kTextDescriptionNormal(context: context),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

enum PagingState {
  loading,
  success,
  noMoreData,
  noInternet,
  failed,
  somethingWrong,
}
