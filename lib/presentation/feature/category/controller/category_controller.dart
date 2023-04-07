import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tostinh/domain/entities/response/products_response.dart';
import 'package:tostinh/presentation/feature/category/view/widget/category_product_list_layout_switcher/category_product_list_layout_switcher.dart';

import '../../../../base/base_result.dart';
import '../../../../domain/entities/query/product_query.dart';
import '../../../../domain/usecase/product_usecase.dart';
import '../../../component/view/custom_request_indicator.dart';
import '../../../component/view/custom_sliver_paging.dart';

class CategoryController extends GetxController {
  final ProductUseCase _productUseCase = Get.find();
  final RequestIndicatorController requestIndicatorController =
      RequestIndicatorController();
  ViewLayout viewLayout = ViewLayout.grid;
  List<ProductData> products = [];

  @override
  onInit() {
    super.onInit();
    _checkIFGridViewLayoutRendering();
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

  onSwtichViewLayout() {
    if (viewLayout == ViewLayout.grid) {
      viewLayout = ViewLayout.list;
    } else {
      viewLayout = ViewLayout.grid;
    }
    update();
  }

  _checkIFGridViewLayoutRendering() {
    final box = GetStorage();
    if (box.read('viewLayout') != null) {
      viewLayout = box.read('viewLayout') ? ViewLayout.grid : ViewLayout.list;
    }
  }
}
