import '../../base/base_result.dart';
import '../../domain/entities/body/address_request_body.dart';
import '../../domain/entities/response/address_response.dart';
import '../../domain/entities/response/error_response.dart';
import '../../domain/entities/response/message_response.dart';
import '../../domain/entities/result/address_result.dart';
import '../../domain/entities/result/message_result.dart';
import '../../domain/repository/address_repository.dart';
import '../../utils/helper/api_helper.dart';
import '../datasource/api_datasource.dart';

class AddressRepositoryImpl extends AddressRepository {
  final ApiDataSource _dataSource;

  AddressRepositoryImpl({
    required ApiDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<MessageResult> create({required AddressRequestBody body}) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.createAddress(body: body);
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
  Future<AddressResult> get() async {
    final result = AddressResult();
    try {
      final response = await _dataSource.getAddress();
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = AddressResponse.fromJson(response.body);
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
  Future<MessageResult> delete({required int id}) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.deleteAddress(id: id);
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
  Future<MessageResult> update({
    required int id,
    required AddressRequestBody body,
  }) async {
    final result = MessageResult();
    try {
      final response = await _dataSource.updateAddress(id: id, body: body);
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
