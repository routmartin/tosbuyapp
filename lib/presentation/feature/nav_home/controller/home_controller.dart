import 'package:get/get.dart';
import 'package:tostinh/domain/entities/query/product_query.dart';
import 'package:tostinh/domain/entities/response/products_response.dart';
import 'package:tostinh/domain/usecase/product_usecase.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../base/base_result.dart';
import '../../../component/view/custom_request_indicator.dart';

class HomeController extends GetxController {
  final ProductUseCase _productUseCase = Get.find();
  final RequestIndicatorController requestIndicatorController =
      RequestIndicatorController();
  List<ProductData> products = [];

  ///When visibleFraction equal 1 it's mean this page have full visible
  ///If equal 0 it's mean this page is close and navigate to another page.
  void onVisibilityChanged(VisibilityInfo info) {}

  Future<PagingState> requestMoreProduct() async {
    PagingState pagingState = PagingState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      limit: requestIndicatorController.limit,
      offset: requestIndicatorController.offset,
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
        limit: requestIndicatorController.limit,
        offset: requestIndicatorController.offset);
    final result =
        await _productUseCase.getProductList(productQuery: productQuery);
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
}
