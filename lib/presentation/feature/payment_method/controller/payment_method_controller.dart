import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';

import '../../../../base/base_result.dart';
import '../../../../domain/entities/response/payment_method_response.dart';
import '../../../../domain/usecase/payment_method_usecase.dart';

class PaymentMethodController extends GetxController {
  final PaymentMethodUseCase _useCase = Get.find();
  List<PaymentMethod> paymentMethods = [];

  Future<RequestIndicatorState> getPaymentMethod() async {
    RequestIndicatorState status;
    final result = await _useCase.get();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        status = RequestIndicatorState.success;
        paymentMethods = result.successResponse!.payments;
        break;
      case RequestStatus.noInternet:
        status = RequestIndicatorState.noInternet;
        break;
      case RequestStatus.failed:
        status = RequestIndicatorState.failed;
        break;
      case RequestStatus.somethingWrong:
        status = RequestIndicatorState.somethingWrong;
        break;
    }
    update();
    return status;
  }
}
