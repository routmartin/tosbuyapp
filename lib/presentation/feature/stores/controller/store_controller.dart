import 'package:get/get.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../assets/app_locals.dart';
import '../../../../base/base_result.dart';
import '../../../../domain/entities/response/store_response.dart';
import '../../../../domain/usecase/store_usecase.dart';
import '../../../component/view/custom_request_indicator.dart';
import '../../../component/view/custom_sliver_paging.dart';

class StoreController extends GetxController {
  final StoreUseCase _useCase = Get.find();
  final RequestIndicatorController requestController =
      RequestIndicatorController();
  List<Store> stores = [];
  int limit = 10;
  int offset = 0;
  bool toggleReset = false;

  Future<RequestIndicatorState> getStores() async {
    RequestIndicatorState status;
    offset = 0;
    final result = await _useCase.get(limit: limit, offset: offset);
    switch (result.requestStatus!) {
      case RequestStatus.success:
        toggleReset = !toggleReset;
        offset = offset + limit;
        status = RequestIndicatorState.success;
        stores = result.successResponse!.data;
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

  Future<PagingState> getMoreStores() async {
    final result = await _useCase.get(limit: limit, offset: offset);
    stores.addAll(result.successResponse!.data);
    update();
    offset = offset + limit;
    return result.successResponse!.data.isEmpty
        ? PagingState.noMoreData
        : PagingState.success;
  }

  void follow(int storeId) async {
    CustomDialog.showDialogLoading();
    final result = await _useCase.follow(storeId: storeId);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        stores.forEach((store) {
          if (store.id == storeId) store.isFollower = true;
        });
        CustomDialog.showSnackbar(message: AppLocals.storeFollowSuccess.tr);
        update();
        break;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.globalNoInternet.tr);
        break;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(
            message:
                "${AppLocals.globalInternalError.tr} [${result.errorResponse?.status}]");
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.globalSomethingWrong.tr);
        break;
    }
  }

  void unfollow(int storeId) async {
    CustomDialog.showDialogLoading();
    final result = await _useCase.unfollow(storeId: storeId);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        stores.forEach((store) {
          if (store.id == storeId) store.isFollower = false;
        });
        CustomDialog.showSnackbar(message: AppLocals.storeUnfollowSuccess.tr);
        update();
        break;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.globalNoInternet.tr);
        break;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(
            message:
                "${AppLocals.globalInternalError.tr} [${result.errorResponse?.status}]");
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.globalSomethingWrong.tr);
        break;
    }
  }
}
