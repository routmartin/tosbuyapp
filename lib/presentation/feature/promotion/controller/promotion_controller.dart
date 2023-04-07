import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../assets/app_locals.dart';
import '../../../../base/base_result.dart';
import '../../../../domain/entities/body/add_wishlist_request_body.dart';
import '../../../../domain/entities/query/product_query.dart';
import '../../../../domain/entities/response/products_response.dart';
import '../../../../domain/usecase/product_usecase.dart';
import '../../../../domain/usecase/wishlist_usecase.dart';
import '../../../component/view/custom_sliver_paging.dart';

class PromotionController extends GetxController {
  final ProductUseCase _productUseCase = Get.find();
  final WishlistUsecase _wishlistUsecase = Get.find();
  final RequestIndicatorController indicatorController =
      RequestIndicatorController();
  List<ProductData> promotions = [];

  Future<RequestIndicatorState> requestFirstPromotion() async {
    RequestIndicatorState requestIndicatorState =
        RequestIndicatorState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      promotion: true,
      limit: indicatorController.limit,
      offset: indicatorController.offset,
    );
    final result = await _productUseCase.getProductList(
      productQuery: productQuery,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.meta.total != 0) {
          promotions = result.successResponse?.data ?? [];
          requestIndicatorState = RequestIndicatorState.success;
        } else {
          promotions = [];
          requestIndicatorState = RequestIndicatorState.noData;
        }
        update();
        break;
      case RequestStatus.noInternet:
        requestIndicatorState = RequestIndicatorState.noInternet;
        break;
      case RequestStatus.failed:
        requestIndicatorState = RequestIndicatorState.failed;
        break;
      case RequestStatus.somethingWrong:
        requestIndicatorState = RequestIndicatorState.somethingWrong;
        break;
    }
    return requestIndicatorState;
  }

  Future<PagingState> requestMorePromotion() async {
    PagingState pagingState = PagingState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      promotion: true,
      limit: indicatorController.limit,
      offset: indicatorController.offset,
    );
    final result = await _productUseCase.getProductList(
      productQuery: productQuery,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.data?.isNotEmpty == true) {
          promotions.addAll(result.successResponse?.data ?? []);
          pagingState = PagingState.success;
        } else {
          pagingState = PagingState.noMoreData;
        }
        update();
        break;
      case RequestStatus.noInternet:
        pagingState = PagingState.noInternet;
        break;
      case RequestStatus.failed:
        pagingState = PagingState.failed;
        break;
      case RequestStatus.somethingWrong:
        pagingState = PagingState.somethingWrong;
        break;
    }
    return pagingState;
  }

  void addWishlist({required int productId}) async {
    CustomDialog.showDialogLoading();
    final AddWishlistRequestBody body = AddWishlistRequestBody(productId);
    final result = await _wishlistUsecase.addWishlist(
      addWishlistRequestBody: body,
    );
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        CustomDialog.showSnackbar(message: AppLocals.wishlistAddSuccess.tr);
        update();
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
