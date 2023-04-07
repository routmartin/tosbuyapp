import '../../base/base_result.dart';
import '../../domain/entities/body/cart_request_body.dart';
import '../../domain/entities/response/cart_response.dart';
import '../../domain/entities/response/error_response.dart';
import '../../domain/entities/response/message_response.dart';
import '../../domain/entities/result/cart_result.dart';
import '../../domain/entities/result/message_result.dart';
import '../../domain/repository/cart_repository.dart';
import '../../utils/helper/api_helper.dart';
import '../datasource/api_datasource.dart';

class CartRepositoryImpl extends CartRepository {
  final ApiDataSource _dataSource;

  CartRepositoryImpl({
    required ApiDataSource dataSource,
  }) : _dataSource = dataSource;
  @override
  Future<MessageResult> add({required AddCartRequestBody body}) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.addCart(body: body);
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = MessageResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (error) {
      _dataSource.printErrorService(error.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<CartResult> get() async {
    final result = CartResult();
    try {
      final response = await _dataSource.getCart();
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = CartResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (error) {
      _dataSource.printErrorService(error.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<MessageResult> remove({required RemoveCartRequestBody body}) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.removeCart(body: body);
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = MessageResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (error) {
      _dataSource.printErrorService(error.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<MessageResult> update({required UpdateCartRequestBody body}) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.updateCart(body: body);
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = MessageResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (error) {
      _dataSource.printErrorService(error.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }
}
