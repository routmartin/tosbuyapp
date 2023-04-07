import '../../base/base_result.dart';
import '../../domain/entities/response/error_response.dart';
import '../../domain/entities/response/payment_method_response.dart';
import '../../domain/entities/result/payment_method_result.dart';
import '../../domain/repository/payment_method_repository.dart';
import '../../utils/helper/api_helper.dart';
import '../datasource/api_datasource.dart';

class PaymentMethodRepositoryImpl extends PaymentMethodRepository {
  final ApiDataSource _dataSource;

  PaymentMethodRepositoryImpl({
    required ApiDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<PaymentMethodResult> get() async {
    final result = PaymentMethodResult();
    try {
      final response = await _dataSource.getPaymentMethod();
      result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = PaymentMethodResponse.fromJson(
            response.body,
          );
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
