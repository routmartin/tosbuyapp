import 'package:tostinh/domain/entities/body/add_wishlist_request_body.dart';
import 'package:tostinh/domain/entities/response/error_response.dart';
import 'package:tostinh/domain/entities/response/result_response.dart';
import 'package:tostinh/domain/entities/result/wishlist_result.dart';
import 'package:tostinh/domain/repository/wishlist_repository.dart';
import 'package:tostinh/utils/helper/api_helper.dart';

import '../../base/base_result.dart';
import '../../domain/entities/response/wishlist_responses.dart';
import '../datasource/api_datasource.dart';

class WishlistRepositoryImpl extends WishlistRepository {
  final ApiDataSource _apiDataSource;

  WishlistRepositoryImpl({required ApiDataSource apiDataSource})
      : _apiDataSource = apiDataSource;

  @override
  Future<WishlistResult> addWishlist(
      {required AddWishlistRequestBody addWishlistRequestBody}) async {
    final result = WishlistResult();
    try {
      final response = await _apiDataSource.addWishlist(
          addWishlistRequestBody: addWishlistRequestBody);
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = ResultResponse.fromJson(response.body);
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
  Future<WishlistResult> removeWishlist({required int productId}) async {
    final result = WishlistResult();
    try {
      final response =
          await _apiDataSource.removeWishlist(productId: productId);
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = ResultResponse.fromJson(response.body);
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

  @override
  Future<WishlistResults> get() async {
    final result = WishlistResults();
    try {
      final response = await _apiDataSource.getwishLists();
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = WishlistResponses.fromJson(response.body);
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
}
