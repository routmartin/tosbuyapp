import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../assets/app_colors.dart';
import '../../../../assets/app_locals.dart';
import '../../../../base/base_result.dart';
import '../../../../domain/entities/body/cart_request_body.dart';
import '../../../../domain/entities/response/cart_response.dart';
import '../../../../domain/usecase/cart_usecase.dart';
import '../../../component/view/custom_request_indicator.dart';

class CartController extends GetxController {
  final CartUseCase _cartUseCase = Get.find();
  final TextEditingController qtyController = TextEditingController();
  final RequestIndicatorController indicatorController =
      RequestIndicatorController();
  bool validQty = false;
  List<Cart> carts = [];
  int? totalCart = 0;
  double totalAmount = 0.0;
  bool? isSelectedAllProduct = false;

  ///When visibleFraction equal 1 it's mean this page have full visible
  ///If equal 0 it's mean this page is close and navigate to another page.
  void onVisibilityChanged(VisibilityInfo info) {}

  void validateQty(bool value) {
    if (int.parse(qtyController.text) > 0) {
      validQty = value;
      update();
    }
  }

  @override
  void onClose() {
    qtyController.dispose();
    super.onClose();
  }

  Future<RequestIndicatorState> getCart() async {
    RequestIndicatorState status;
    final result = await _cartUseCase.get();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        carts = result.successResponse!.data;
        totalCart = result.successResponse?.meta.total;
        if (result.successResponse?.data.isNotEmpty == true) {
          status = RequestIndicatorState.success;
        } else {
          status = RequestIndicatorState.noCart;
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

  void updateQty({
    required String cartId,
    required int qty,
    bool? isBatchUpdate,
  }) async {
    CustomDialog.showDialogLoading();
    Product? updateProductQty;
    int quantity = 0;
    for (var cart in carts) {
      for (var product in cart.products) {
        if (product.cartId == cartId) {
          updateProductQty = product;
          quantity = product.qty;
        }
      }
    }
    quantity = isBatchUpdate == null ? quantity + qty : qty;
    final UpdateCartRequestBody body = UpdateCartRequestBody(
      id: cartId,
      qty: quantity,
    );
    final result = await _cartUseCase.update(body: body);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        updateProductQty?.qty = quantity;
        update();
        break;
      case RequestStatus.noInternet:
        CustomDialog.showDialogInfo(
          title: AppLocals.stateNoInternetHeader.tr,
          content: AppLocals.stateNoInternetDescription.tr,
        );
        break;
      case RequestStatus.failed:
        CustomDialog.showDialogInfo(
            title: AppLocals.stateFailedHeader.tr,
            content:
                "${result.errorResponse?.message} [${result.errorResponse?.status}]",
            actions: [
              ButtonDialogInfo(
                onPressed: () => Get.back(),
                title: "Okay",
                color: AppColors.red,
              ),
            ]);
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showDialogInfo(
          title: AppLocals.stateSomethingWrongHeader.tr,
          content: AppLocals.stateSomethingWrongDescription.tr,
        );
        break;
    }
  }

  void selectProduct({
    required int cartIndex,
    required int productIndex,
    bool? isSelect,
  }) {
    totalAmount = 0.0;
    carts[cartIndex].products[productIndex].isSelected = isSelect;
    carts.forEach((cart) {
      cart.products.forEach((product) {
        if (product.isSelected == true) {
          double subTotal = product.prices.priceAfterDiscount * product.qty;
          totalAmount = totalAmount + subTotal;
        }
      });
    });
    for (var cart in carts) {
      for (var product in cart.products) {
        if (product.isSelected == false) {
          isSelectedAllProduct = false;
          update();
          return;
        }
      }
    }
    isSelectedAllProduct = true;
    update();
  }

  void selectAll(bool? value) {
    for (var cIndex = 0; cIndex < carts.length; cIndex++) {
      for (var pIndex = 0; pIndex < carts[cIndex].products.length; pIndex++) {
        selectProduct(cartIndex: cIndex, productIndex: pIndex, isSelect: value);
      }
    }
    isSelectedAllProduct = value;
    update();
  }

  void confirmRemove() {
    final List<String> cartId = [];
    carts.forEach((cart) {
      cart.products.forEach((product) {
        if (product.isSelected == true) cartId.add(product.cartId);
      });
    });
    if (cartId.isNotEmpty) {
      CustomDialog.showDialogInput(
        title: AppLocals.globalConfirmDelete.tr,
        content: Text(
          AppLocals.cartDeleteMessage.trParams({'count': '${cartId.length}'}),
        ),
        actions: [
          ButtonDialogInfo(
            onPressed: () => Get.back(),
            title: AppLocals.globalCancel.tr,
            color: AppColors.black,
          ),
          ButtonDialogInfo(
            onPressed: () {
              Get.back();
              _remove(cartId: cartId);
            },
            title: AppLocals.globalConfirm.tr,
            color: AppColors.red,
          )
        ],
      );
    }
  }

  void _remove({required List<String> cartId}) async {
    CustomDialog.showDialogLoading();
    final RemoveCartRequestBody body = RemoveCartRequestBody(id: cartId);
    final result = await _cartUseCase.remove(body: body);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        indicatorController.reload();
        totalAmount = 0.0;
        isSelectedAllProduct = false;
        break;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.globalNoInternet.tr);
        break;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(
          message:
              "${AppLocals.globalInternalError.tr} [${result.errorResponse?.status}]",
        );
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.globalSomethingWrong.tr);
        break;
    }
  }
}
