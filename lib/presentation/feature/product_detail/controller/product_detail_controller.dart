import 'package:get/get.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';
import '../../../../assets/app_locals.dart';
import '../../../../base/base_result.dart';
import '../../../../domain/entities/body/add_wishlist_request_body.dart';
import '../../../../domain/entities/body/cart_request_body.dart';
import '../../../../domain/entities/query/product_query.dart';
import '../../../../domain/entities/query/product_review_query.dart';
import '../../../../domain/entities/response/product_detail_response.dart';
import '../../../../domain/entities/response/product_review_response.dart';
import '../../../../domain/entities/response/products_response.dart';
import '../../../../domain/entities/result/product_review_result.dart';
import '../../../../domain/usecase/cart_usecase.dart';
import '../../../../domain/usecase/product_usecase.dart';
import '../../../../domain/usecase/wishlist_usecase.dart';
import '../../../component/view/custom_request_indicator.dart';
import '../view/widget/product_detail_review_section/product_detail_review_star_model.dart';

class ProductDetailController extends GetxController {
  final ProductUseCase _productUseCase = Get.find();
  final CartUseCase _cartUseCase = Get.find();
  final WishlistUsecase _wishlistUseCase = Get.find();
  final ProductData productData = Get.arguments;
  final RequestIndicatorController indicatorController =
      RequestIndicatorController();
  ProductDetailResponse? productDetail;
  ProductReviewResponse? productReview;
  List<ProductData> productRelated = <ProductData>[];
  List<String> images = [];
  List<ProductDetailReviewStarModel> stars = [];

  bool isProductDetailLoaded = false;
  bool isProductReviewLoaded = false;
  bool isProductRelatedLoaded = false;

  int totalRelatedProduct = 0;
  int price = 0;
  int decimal = 0;

  Future<RequestIndicatorState> requestDetailsProduct() async {
    RequestIndicatorState requestIndicatorState =
        RequestIndicatorState.somethingWrong;
    final result = await _productUseCase.getProductDetail(id: productData.id);
    switch (result.requestStatus!) {
      case RequestStatus.success:
        final response = result.successResponse;
        final review = result.successResponse?.data.review;
        productDetail = response;
        images = response!.data.media;
        initReviewStar(review: review);
        _formatSalePrice();
        isProductDetailLoaded = true;
        requestIndicatorState = RequestIndicatorState.success;
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

  Future<RequestIndicatorState> requestReviewProduct() async {
    RequestIndicatorState requestIndicatorState =
        RequestIndicatorState.somethingWrong;
    final ProductReviewResult result = await _productUseCase.getProductReview(
      productReviewQuery: ProductReviewQuery(
        limit: 5,
        offset: 0,
        productId: productData.id,
      ),
    );

    switch (result.requestStatus!) {
      case RequestStatus.success:
        productReview = result.successResponse!;
        isProductReviewLoaded = true;
        requestIndicatorState = RequestIndicatorState.success;
        update();
        break;
      case RequestStatus.noInternet:
        requestIndicatorState = RequestIndicatorState.noInternet;
        break;
      case RequestStatus.failed:
        requestIndicatorState = RequestIndicatorState.somethingWrong;
        break;
      case RequestStatus.somethingWrong:
        requestIndicatorState = RequestIndicatorState.somethingWrong;
        break;
    }
    return requestIndicatorState;
  }

  Future<RequestIndicatorState> requestRelatedProduct() async {
    RequestIndicatorState requestIndicatorState =
        RequestIndicatorState.somethingWrong;
    final ProductQuery productQuery = ProductQuery(
      subCategoryId: productDetail?.data.category.id,
      excludeProductId: productDetail?.data.id,
      limit: indicatorController.limit,
      offset: indicatorController.offset,
    );
    final result = await _productUseCase.getProductList(
      productQuery: productQuery,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        if (result.successResponse?.data?.isNotEmpty == true) {
          productRelated = result.successResponse!.data!;
          totalRelatedProduct = result.successResponse!.meta.total;
          requestIndicatorState = RequestIndicatorState.success;
        } else {
          productRelated = [];
          requestIndicatorState = RequestIndicatorState.noRelatedProduct;
        }
        isProductRelatedLoaded = true;
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

  Future<bool> requestAddWishlist() async {
    final AddWishlistRequestBody body = AddWishlistRequestBody(productData.id);
    final result = await _wishlistUseCase.addWishlist(
      addWishlistRequestBody: body,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        CustomDialog.showSnackbar(message: AppLocals.wishlistAddSuccess.tr);
        return true;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.noInternetOccurred.tr);
        return false;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(message: result.errorResponse?.message);
        return false;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.globalSomethingWrong.tr);
        return false;
    }
  }

  Future<bool> requestRemoveWishlist() async {
    final result = await _wishlistUseCase.removeWishlist(
      productId: productData.id,
    );
    switch (result.requestStatus!) {
      case RequestStatus.success:
        CustomDialog.showSnackbar(message: AppLocals.wishlistRemoveSuccess.tr);
        return true;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.noInternetOccurred.tr);
        return false;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(message: AppLocals.noInternetOccurred.tr);
        return false;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.noInternetOccurred.tr);
        return false;
    }
  }

  void addToCart({required int? productId}) async {
    final AddCartRequestBody body = AddCartRequestBody(
      productId: productId ?? 0,
      qty: 1,
    );
    final result = await _cartUseCase.add(body: body);
    switch (result.requestStatus!) {
      case RequestStatus.success:
        CustomDialog.showSnackbar(
          message: AppLocals.cartAddSuccess.tr,
        );
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

  void selectOptionValue({
    required int optionIndex,
    required int? optionValueId,
  }) {
    productDetail?.data.options[optionIndex].optionValue.forEach((item) {
      item.isSelected = item.optionValueId == optionValueId;
    });
    update();
  }

  void resetSelectedOption() {
    productDetail?.data.options.forEach((option) {
      option.optionValue.forEach((optionValue) {
        optionValue.isSelected = false;
      });
    });
  }

  void _formatSalePrice() {
    price = int.parse(
      productDetail!.data.prices.priceAfterDiscount.toString().split(".")[0],
    );
    decimal = int.parse(
      productDetail!.data.prices.priceAfterDiscount.toString().split(".")[1],
    );
  }

  void initReviewStar({required ProductReview? review}) {
    final first = review?.star1 ?? 0;
    final second = review?.star2 ?? 0;
    final third = review?.star3 ?? 0;
    final forth = review?.star4 ?? 0;
    final fifth = review?.star5 ?? 0;
    final totalStar = first + second + third + forth + fifth;
    stars.clear();
    stars.add(ProductDetailReviewStarModel(
      star: first,
      percentage: first / totalStar,
    ));
    stars.add(ProductDetailReviewStarModel(
      star: second,
      percentage: second / totalStar,
    ));
    stars.add(ProductDetailReviewStarModel(
      star: third,
      percentage: third / totalStar,
    ));
    stars.add(ProductDetailReviewStarModel(
      star: forth,
      percentage: forth / totalStar,
    ));
    stars.add(ProductDetailReviewStarModel(
      star: fifth,
      percentage: fifth / totalStar,
    ));
  }
}
