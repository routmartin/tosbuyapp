import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/domain/entities/result/profile_detail_result.dart';
import 'package:tostinh/domain/usecase/profile_detail_usecase.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/routes/app_routes.dart';
import 'package:tostinh/shared_preferences/app_credential_shared_pref.dart';
import 'package:tostinh/shared_preferences/app_profile_shared_pref.dart';
import 'package:tostinh/shared_preferences/app_route_shared_pref.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../base/base_result.dart';

class ProfileController extends GetxController {
  final ProfileDetailUseCase _profileDetailUseCase = Get.find();
  ProfileDetailResult profileDetailResult = ProfileDetailResult();
  bool isNotificationEnabled = false;

  Future<RequestIndicatorState> requestProfileDetail() async {
    RequestIndicatorState status = RequestIndicatorState.somethingWrong;
    profileDetailResult = await _profileDetailUseCase.profileDetail();
    switch (profileDetailResult.requestStatus!) {
      case RequestStatus.success:
        final AppProfileSharedPref appProfileSharedPref =
            AppProfileSharedPref();
        appProfileSharedPref.setProfileDetail =
            profileDetailResult.successResponse!;
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

  void signOut() {
    CustomDialog.showDialogInfo(
      title: AppLocals.profileLogoutHeader.tr,
      content: AppLocals.profileLogoutDescription.tr,
      actions: [
        ButtonDialogInfo(
          onPressed: () {
            final appCredentialSharedPref = AppCredentialSharedPref();
            final appRouteSharedPref = AppRouteSharedPref();
            appCredentialSharedPref.removeAllCredential();
            appRouteSharedPref.resetRoute();
            Get.offAllNamed(AppRoutes.signIn);
          },
          title: AppLocals.profileLogoutHeader.tr,
          color: AppColors.red,
        ),
      ],
    );
  }
}
