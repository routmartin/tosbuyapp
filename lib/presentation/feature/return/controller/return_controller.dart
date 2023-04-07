import 'package:get/get.dart';

import '../../../../base/base_result.dart';
import '../../../../domain/entities/response/address_response.dart';
import '../../../../domain/usecase/address_usecase.dart';
import '../../../component/view/custom_request_indicator.dart';

class ReturnController extends GetxController {
  final AddressUseCase _useCase = Get.find();
  List<Address> addresses = [];
  Future<RequestIndicatorState> getAddress() async {
    RequestIndicatorState status;
    final result = await _useCase.get();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        status = RequestIndicatorState.success;
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
