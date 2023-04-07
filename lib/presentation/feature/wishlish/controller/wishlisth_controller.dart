import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/domain/usecase/wishlist_usecase.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../assets/app_colors.dart';
import '../../../../assets/app_locals.dart';
import '../../../../base/base_result.dart';
import '../../../../domain/entities/response/wishlist_responses.dart';
import '../../../component/view/custom_request_indicator.dart';

class WishlishController extends GetxController {
  final WishlistUsecase _useCase = Get.find();
  final RequestIndicatorController requestController =
      RequestIndicatorController();
  List<WishlistStores> stores = [];
  int limit = 10;
  int offset = 0;

  Future<RequestIndicatorState> getWishlists() async {
    RequestIndicatorState status;
    final result = await _useCase.get();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse!.data.isNotEmpty) {
          status = RequestIndicatorState.success;
          stores = result.successResponse!.data;
        } else {
          status = RequestIndicatorState.noWishlist;
        }
        break;
      case RequestStatus.noInternet:
        status = RequestIndicatorState.noInternet;
        break;
      case RequestStatus.failed:
        status = RequestIndicatorState.failed;
        break;
      case RequestStatus.somethingWrong:
        status = RequestIndicatorState.somethingWrong;
        break;
    }
    update();
    return status;
  }

  void confirmRemoveItemFromWishlist(int id) {
    CustomDialog.showDialogInput(
      title: AppLocals.globalConfirmDelete.tr,
      content: Text(AppLocals.wishlistConfirmMessage.tr),
      actions: [
        ButtonDialogInfo(
          onPressed: () => Get.back(),
          title: AppLocals.globalCancel.tr,
          color: AppColors.black,
        ),
        ButtonDialogInfo(
          onPressed: () {
            Get.back();
            _removeWishlist(id).then((isSuccess) {
              if (isSuccess) onReload();
            });
          },
          title: AppLocals.globalConfirm.tr,
          color: AppColors.red,
        )
      ],
    );
  }

  Future<bool> _removeWishlist(int id) async {
    CustomDialog.showDialogLoading();
    final result = await _useCase.removeWishlist(productId: id);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.message == "ok") {
          CustomDialog.showSnackbar(
            message: AppLocals.wishlistRemoveSuccess.tr,
          );
          return true;
        } else {
          CustomDialog.showSnackbar(
            message: result.successResponse?.message,
          );
          return false;
        }
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(
          message: AppLocals.noInternetOccurred.tr,
        );
        return false;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(
          message: AppLocals.noInternetOccurred.tr,
        );
        return false;
      case RequestStatus.somethingWrong:
        Get.showSnackbar(GetSnackBar(
          message: AppLocals.stateSomethingWrongHeader.tr,
        ));
        CustomDialog.showSnackbar(
          message: AppLocals.noInternetOccurred.tr,
        );
        return false;
    }
  }

  // Need to change flow on product detail page or request api to response data to map with ProductData Model
  goToProductDetail(int id) {
    // Get.toNamed(AppRoutes.productDetail, arguments: id);
  }

  onReload() {
    requestController.reload();
  }
}
