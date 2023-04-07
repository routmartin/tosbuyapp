import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/domain/entities/body/login_request_body.dart';
import 'package:tostinh/domain/usecase/auth_usecase.dart';
import 'package:tostinh/routes/app_routes.dart';
import 'package:tostinh/shared_preferences/app_credential_shared_pref.dart';
import 'package:tostinh/shared_preferences/app_profile_shared_pref.dart';
import 'package:tostinh/shared_preferences/app_route_shared_pref.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../base/base_result.dart';
import '../../../../../domain/usecase/profile_detail_usecase.dart';

class PinCodeController extends GetxController {
  List<int> pincodeList = [];
  final AuthUseCase _authUseCase = Get.find();
  final ProfileDetailUseCase _profileDetailUseCase = Get.find();
  final LoginRequestBody _loginRequestBody = Get.arguments;

  onPinCodeTab(int code) {
    if (pincodeList.length < 6) {
      pincodeList.add(code);
      update();
      if (pincodeList.length == 6) {
        var concatenate = StringBuffer();
        pincodeList.forEach((element) {
          concatenate.write(element);
        });
        _loginRequestBody.pin = concatenate.toString();
        _login();
      }
    }
  }

  Future<void> _getProfile() async {
    final result = await _profileDetailUseCase.profileDetail();
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        final AppProfileSharedPref appProfileSharedPref =
            AppProfileSharedPref();
        appProfileSharedPref.setProfileDetail = result.successResponse!;
        Get.offAllNamed(AppRoutes.navigation);
        break;
      case RequestStatus.noInternet:
        CustomDialog.showDialogInfo(
          title: AppLocals.loginFailed.tr,
          content: AppLocals.stateNoInternetDescription.tr,
        );
        break;
      case RequestStatus.failed:
        CustomDialog.showDialogInfo(
          title: AppLocals.loginFailed.tr,
          content: AppLocals.stateFailedDescription.tr,
        );
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showDialogInfo(
          title: AppLocals.loginFailed.tr,
          content: AppLocals.stateSomethingWrongDescription.tr,
        );
        break;
    }
  }

  void _login() async {
    CustomDialog.showDialogLoading(isBackEnabled: false);
    final result =
        await _authUseCase.loginWithPhoneNumber(body: _loginRequestBody);
    if (result.requestStatus != RequestStatus.success) {
      CustomDialog.closeDialog();
      pincodeList.clear();
      update();
    }
    switch (result.requestStatus!) {
      case RequestStatus.success:
        switch (result.successResponse!.status) {
          case 201:
            final AppRouteSharedPref appRouteSharedPref = AppRouteSharedPref();
            final AppCredentialSharedPref appCredentialSharedPref =
                AppCredentialSharedPref();
            appRouteSharedPref.initialRoute = AppRoutes.navigation;
            appCredentialSharedPref.token =
                result.successResponse!.data!.accessToken;
            appCredentialSharedPref.refreshToken =
                result.successResponse!.data!.refreshToken;
            _getProfile();
            break;
          case 1114:
            CustomDialog.showDialogInfo(
              title: AppLocals.loginFailed.tr,
              content: AppLocals.signInNotYetRegisterDescription.tr,
              actions: [
                ButtonDialogInfo(
                  onPressed: () {
                    CustomDialog.closeDialog();
                    Get.toNamed(AppRoutes.profileInfo);
                  },
                  title: AppLocals.yes.tr,
                  color: Colors.blue,
                ),
                ButtonDialogInfo(
                  onPressed: () {
                    CustomDialog.closeDialog();
                  },
                  title: AppLocals.no.tr,
                  color: Colors.red,
                )
              ],
            );
            break;
          case 1112:
            CustomDialog.showDialogInfo(
              title: AppLocals.loginFailed.tr,
              content: AppLocals.signInNotYetVerifyDescription.tr,
              actions: [
                ButtonDialogInfo(
                  onPressed: () {
                    CustomDialog.closeDialog();
                  },
                  title: AppLocals.no.tr,
                  color: Colors.red,
                ),
                ButtonDialogInfo(
                  onPressed: () {
                    CustomDialog.closeDialog();
                    Get.toNamed(AppRoutes.verifyOTP,
                        arguments: _loginRequestBody);
                  },
                  title: AppLocals.yes.tr,
                  color: Colors.blue,
                )
              ],
            );
            break;
        }
        break;
      case RequestStatus.noInternet:
        CustomDialog.showDialogInfo(
          title: AppLocals.loginFailed.tr,
          content: AppLocals.stateNoInternetDescription.tr,
        );
        break;
      case RequestStatus.failed:
        if (result.errorResponse!.status == 1120) {
          CustomDialog.showDialogInfo(
            title: AppLocals.loginFailed.tr,
            content: AppLocals.signInWrongPinDescription.tr,
            actions: [
              ButtonDialogInfo(
                onPressed: () {
                  CustomDialog.closeDialog();
                },
                title: AppLocals.ok.tr,
                color: Colors.blue,
              ),
            ],
          );
        } else {
          CustomDialog.showDialogInfo(
            title: AppLocals.loginFailed.tr,
            content: AppLocals.stateFailedDescription.tr,
            actions: [
              ButtonDialogInfo(
                onPressed: () {
                  CustomDialog.closeDialog();
                },
                title: AppLocals.close.tr,
                color: Colors.red,
              )
            ],
          );
        }
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showDialogInfo(
          title: AppLocals.loginFailed.tr,
          content: AppLocals.stateSomethingWrongDescription.tr,
        );
        break;
    }
  }

  onClear() {
    pincodeList.clear();
    update();
  }

  onRemove() {
    if (pincodeList.isNotEmpty) pincodeList.removeLast();
    update();
  }

  bool isActivePinCodeSpere(int index) {
    if (pincodeList.length > index) return true;
    return false;
  }
}
