import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../base/base_result.dart';
import '../../../../domain/entities/response/address_response.dart';
import '../../../../domain/usecase/address_usecase.dart';

class AddressController extends GetxController {
  final AddressUseCase _useCase = Get.find();
  final bool? isSelectShippingAddress = Get.arguments;
  List<Address> addresses = [];

  Future<RequestIndicatorState> getAddress() async {
    RequestIndicatorState status;
    final result = await _useCase.get();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        addresses = result.successResponse!.addresses;
        if (result.successResponse?.addresses.isNotEmpty == true) {
          status = RequestIndicatorState.success;
        } else {
          status = RequestIndicatorState.noAddress;
        }
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

  void navigateNewAddress({dynamic data}) async {
    await Get.toNamed(AppRoutes.newAddress, arguments: data)
        ?.then((value) => {if (value == true) getAddress()});
  }

  void onSelectedAddress(Address address) {
    Get.back(result: address);
  }
}
