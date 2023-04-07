import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/domain/entities/body/add_wishlist_request_body.dart';
import 'package:tostinh/domain/entities/response/products_response.dart';
import 'package:tostinh/domain/entities/response/store_response.dart';
import 'package:tostinh/domain/usecase/store_usecase.dart';
import 'package:tostinh/domain/usecase/wishlist_usecase.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../assets/app_locals.dart';
import '../../../../base/base_result.dart';
import '../../../../domain/entities/query/product_query.dart';
import '../../../../domain/usecase/product_usecase.dart';
import '../../../component/view/custom_sliver_paging.dart';

class StoreDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final StoreUseCase _storeUseCase = Get.find();
  final ProductUseCase _productUseCase = Get.find();
  final WishlistUsecase _wishlistUsecase = Get.find();
  final int storeId = Get.arguments;
  bool isCollapsed = false;
  Store? store;

  List<ProductData> products = [];
  List<ProductData> promotions = [];
  List<ProductData> bestSales = [];

  final scrollController = ScrollController();
  final nestedScrollViewKey = GlobalKey();
  final RequestIndicatorController requestHomeIndicatorController =
      RequestIndicatorController();
  final RequestIndicatorController requestPromotionIndicatorController =
      RequestIndicatorController();
  final RequestIndicatorController requestBestSaleIndicatorController =
      RequestIndicatorController();
  late TabController tabController;

  void onCollapsed(bool value) {
    isCollapsed = value;
    update();
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    _getDetail();
    super.onReady();
  }

  void _getDetail() async {
    final result = await _storeUseCase.detail(storeId: storeId);
    switch (result.requestStatus!) {
      case RequestStatus.success:
        store = result.successResponse?.data;
        update();
        break;
      case RequestStatus.noInternet:
        break;
      case RequestStatus.failed:
        break;
      case RequestStatus.somethingWrong:
        break;
    }
  }

  void follow() async {
    CustomDialog.showDialogLoading();
    final result = await _storeUseCase.follow(storeId: storeId);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        store?.isFollower = true;
        CustomDialog.showSnackbar(message: AppLocals.storeFollowSuccess.tr);
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

  void unfollow() async {
    CustomDialog.showDialogLoading();
    final result = await _storeUseCase.unfollow(storeId: storeId);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        store?.isFollower = false;
        CustomDialog.showSnackbar(message: AppLocals.storeUnfollowSuccess.tr);
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

  Future<PagingState> requestMoreProduct() async {
    PagingState pagingState = PagingState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      storeId: this.storeId,
      limit: requestHomeIndicatorController.limit,
      offset: requestHomeIndicatorController.offset,
    );
    final result = await _productUseCase.getProductList(
      productQuery: productQuery,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.data?.isNotEmpty == true) {
          products.addAll(result.successResponse?.data ?? []);
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

  Future<RequestIndicatorState> requestFirstProduct() async {
    RequestIndicatorState requestIndicatorState =
        RequestIndicatorState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      storeId: this.storeId,
      limit: requestHomeIndicatorController.limit,
      offset: requestHomeIndicatorController.offset,
    );
    final result = await _productUseCase.getProductList(
      productQuery: productQuery,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.meta.total != 0) {
          products = result.successResponse?.data ?? [];
          requestIndicatorState = RequestIndicatorState.success;
        } else {
          products = [];
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

  Future<RequestIndicatorState> requestFirstPromotion() async {
    RequestIndicatorState requestIndicatorState =
        RequestIndicatorState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      storeId: this.storeId,
      promotion: true,
      limit: requestPromotionIndicatorController.limit,
      offset: requestPromotionIndicatorController.offset,
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
      storeId: this.storeId,
      promotion: true,
      limit: requestPromotionIndicatorController.limit,
      offset: requestPromotionIndicatorController.offset,
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
}
