import 'package:get/get.dart';

import '../../../../base/base_result.dart';
import '../../../../domain/entities/query/product_query.dart';
import '../../../../domain/entities/response/product_detail_response.dart';
import '../../../../domain/entities/response/products_response.dart';
import '../../../../domain/usecase/product_usecase.dart';
import '../../../component/view/custom_request_indicator.dart';
import '../../../component/view/custom_sliver_paging.dart';

class ProductRelatedController extends GetxController {
  final ProductUseCase _productUseCase = Get.find();
  final Data productData = Get.arguments;
  final RequestIndicatorController indicatorController =
      RequestIndicatorController();
  List<ProductData> relateds = [];

  Future<RequestIndicatorState> requestFirstRelated() async {
    RequestIndicatorState requestIndicatorState =
        RequestIndicatorState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      subCategoryId: productData.category.id,
      excludeProductId: productData.id,
      limit: indicatorController.limit,
      offset: indicatorController.offset,
    );
    final result = await _productUseCase.getProductList(
      productQuery: productQuery,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.meta.total != 0) {
          relateds = result.successResponse?.data ?? [];
          requestIndicatorState = RequestIndicatorState.success;
        } else {
          relateds = [];
          requestIndicatorState = RequestIndicatorState.noRelatedProduct;
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

  Future<PagingState> requestMoreRelated() async {
    PagingState pagingState = PagingState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      subCategoryId: productData.category.id,
      excludeProductId: productData.id,
      limit: indicatorController.limit,
      offset: indicatorController.offset,
    );
    final result = await _productUseCase.getProductList(
      productQuery: productQuery,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.data?.isNotEmpty == true) {
          relateds.addAll(result.successResponse?.data ?? []);
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
