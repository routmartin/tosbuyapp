import 'package:tostinh/base/base_result.dart';
import 'package:tostinh/data/datasource/api_datasource.dart';
import 'package:tostinh/domain/entities/query/product_query.dart';
import 'package:tostinh/domain/entities/query/product_review_query.dart';
import 'package:tostinh/domain/entities/response/error_response.dart';
import 'package:tostinh/domain/entities/response/product_detail_response.dart';
import 'package:tostinh/domain/entities/response/product_review_response.dart';
import 'package:tostinh/domain/entities/response/products_response.dart';
import 'package:tostinh/domain/entities/result/product_detail_result.dart';
import 'package:tostinh/domain/entities/result/product_review_result.dart';
import 'package:tostinh/domain/entities/result/products_result.dart';
import 'package:tostinh/domain/repository/product_repository.dart';
import 'package:tostinh/utils/helper/api_helper.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ApiDataSource _apiDataSource;

  ProductRepositoryImpl({required ApiDataSource dataSource})
      : _apiDataSource = dataSource;

  @override
  Future<ProductsResult> getProductList(
      {required ProductQuery productQuery}) async {
    final result = ProductsResult();
    final response =
        await _apiDataSource.getProductList(productQuery: productQuery);
    try {
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);

      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = ProductsResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (error) {
      _apiDataSource.printErrorService(error.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<ProductDetailResult> getProductDetail({required int id}) async {
    final result = ProductDetailResult();
    final response = await _apiDataSource.getProductDetail(id: id);
    try {
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);

      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse =
              ProductDetailResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (error) {
      _apiDataSource.printErrorService(error.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<ProductReviewResult> getProductReview({required ProductReviewQuery productReviewQuery}) async {
    final ProductReviewResult result = ProductReviewResult();
    final response = await _apiDataSource.getProductReview(productReviewQuery: productReviewQuery);
    try {
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse =
              ProductReviewResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (error) {
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }
}
