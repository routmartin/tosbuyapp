import '../../base/base_result.dart';
import '../../domain/entities/response/error_response.dart';
import '../../domain/entities/response/message_response.dart';
import '../../domain/entities/response/store_response.dart';
import '../../domain/entities/result/message_result.dart';
import '../../domain/entities/result/store_result.dart';
import '../../domain/repository/store_repository.dart';
import '../../utils/helper/api_helper.dart';
import '../datasource/api_datasource.dart';

class StoreRepositoryImpl extends StoreRepository {
  final ApiDataSource _dataSource;

  StoreRepositoryImpl({
    required ApiDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<StoreResult> get({required int limit, required int offset}) async {
    final result = StoreResult();
    try {
      final response = await _dataSource.getStores(
        limit: limit,
        offset: offset,
      );
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = StoresResponse.fromJson(response.body);
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
  Future<MessageResult> follow({required int storeId}) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.followStore(storeId: storeId);
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
  Future<MessageResult> unfollow({required int storeId}) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.unfollowStore(storeId: storeId);
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
  Future<StoreDetailResult> detail({required int storeId}) async {
    final result = StoreDetailResult();
    try {
      final response = await _dataSource.getStoreDetail(storeId: storeId);
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = StoreResponse.fromJson(response.body);
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
