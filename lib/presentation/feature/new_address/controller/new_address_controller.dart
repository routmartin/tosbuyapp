import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../assets/app_colors.dart';
import '../../../../assets/app_locals.dart';
import '../../../../assets/app_styles.dart';
import '../../../../base/base_result.dart';
import '../../../../domain/entities/body/address_request_body.dart';
import '../../../../domain/entities/response/address_response.dart';
import '../../../../domain/usecase/address_usecase.dart';

class NewAddressController extends GetxController with WidgetsBindingObserver {
  final AddressUseCase _useCase = Get.find();
  final Address? address = Get.arguments;
  final formKey = GlobalKey<FormState>();
  final Set<Marker> markers = {};
  GoogleMapController? mapController;

  String currentAddress = "";
  bool isOpenAppSettings = false;
  bool isDefaultAddress = false;
  LatLng location = const LatLng(11.5793642, 104.8901867);

  late TextEditingController nameAddressController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressDetailsController;

  @override
  void onInit() async {
    WidgetsBinding.instance.addObserver(this);
    nameAddressController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressDetailsController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() async {
    await Geolocator.requestPermission();
    requestLocationPermission();
    super.onReady();
  }

  void bindingAddress() async {
    nameAddressController.text = address?.label ?? "";
    phoneNumberController.text = address?.phone ?? "";
    addressDetailsController.text = address?.addressDetail ?? "";
    isDefaultAddress = address?.isDefault ?? false;
    location = LatLng(address?.lat ?? 0.0, address?.lng ?? 0.0);
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: location, zoom: 16),
    ));
    update();
  }

  void onCameraMoved() async {
    addressDetailsController.text = AppLocals.addressGettingDetail.tr;
    update();
    final bounds = await mapController?.getVisibleRegion();
    final centerBounds = LatLng(
      (bounds!.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );
    location = LatLng(centerBounds.latitude, centerBounds.longitude);
    _getAddressDetail(location);
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      address != null ? bindingAddress() : getCurrentLocation();
    } else if (status == PermissionStatus.denied) {
    } else if (status == PermissionStatus.permanentlyDenied) {
      openDialog();
    }
  }

  void openDialog() {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: Text(AppLocals.addressLocationPermissionTitle.tr),
        content: Text(AppLocals.addressLocationPermissionMsg.tr),
        actions: [
          TextButton(
            onPressed: () async {
              isOpenAppSettings = true;
              await openAppSettings();
              Get.back();
            },
            child: Text(
              AppLocals.globalOpenSetting.tr,
              style: kTextTitleBold(context: Get.context!)?.copyWith(
                color: AppColors.red,
              ),
            ),
          )
        ],
      ),
    );
  }

  void getCurrentLocation() async {
    addressDetailsController.text = AppLocals.addressGettingDetail.tr;
    update();
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    location = LatLng(position.latitude, position.longitude);
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: location, zoom: 16),
    ));
    _getAddressDetail(location);
  }

  void _getAddressDetail(LatLng location) async {
    try {
      final List<Placemark> places = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      final Placemark place = places.first;
      final street = place.thoroughfare?.isNotEmpty == true
          ? "${place.thoroughfare}, "
          : "";
      final subCity =
          place.subLocality?.isNotEmpty == true ? "${place.subLocality}, " : "";
      final city =
          place.locality?.isNotEmpty == true ? "${place.locality}, " : "";
      final country =
          place.country?.isNotEmpty == true ? "${place.country}, " : "";
      addressDetailsController.text = "$street$subCity$city$country";
      update();
      // ignore: empty_catches
    } catch (e) {}
  }

  void createAddress() async {
    CustomDialog.showDialogLoading();
    final address = AddressRequestBody(
      lat: location.latitude,
      lng: location.longitude,
      label: nameAddressController.text.trim(),
      addressDetail: addressDetailsController.text.trim(),
      isDefault: isDefaultAddress,
      phone: phoneNumberController.text.trim(),
    );
    final result = await _useCase.create(body: address);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        CustomDialog.showSnackbar(message: AppLocals.addressAddNewSuccess.tr);
        Get.back(result: true);
        break;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.globalNoInternet.tr);
        break;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(
          message:
              "${AppLocals.globalInternalError.tr} [${result.errorResponse?.status}]",
        );
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.globalSomethingWrong.tr);
        break;
    }
  }

  void updateAddress() async {
    CustomDialog.showDialogLoading();
    final newAddress = AddressRequestBody(
      lat: location.latitude,
      lng: location.longitude,
      label: nameAddressController.text.trim(),
      addressDetail: addressDetailsController.text.trim(),
      isDefault: isDefaultAddress,
      phone: phoneNumberController.text.trim(),
    );
    final result = await _useCase.update(
      id: address?.id ?? 0,
      body: newAddress,
    );
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        CustomDialog.showSnackbar(message: AppLocals.addressUpdateSuccess.tr);
        Get.back(result: true);
        break;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.globalNoInternet.tr);
        break;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(
          message:
              "${AppLocals.globalInternalError.tr} [${result.errorResponse?.status}]",
        );
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.globalSomethingWrong.tr);
        break;
    }
  }

  void deleteAddress() {
    CustomDialog.showDialogInfo(
      title: AppLocals.globalConfirmDelete.tr,
      content: AppLocals.addressConfirmDeleteMsg.tr,
      actions: [
        ButtonDialogInfo(
            onPressed: () {
              CustomDialog.closeDialog();
              _deleteAddress();
            },
            title: AppLocals.globalConfirm.tr,
            color: AppColors.pink),
        ButtonDialogInfo(
            onPressed: () => CustomDialog.closeDialog(),
            title: AppLocals.globalCancel.tr,
            color: AppColors.red),
      ],
    );
  }

  void _deleteAddress() async {
    CustomDialog.showDialogLoading();
    final result = await _useCase.delete(id: address?.id ?? 0);
    CustomDialog.closeDialog();
    switch (result.requestStatus!) {
      case RequestStatus.success:
        CustomDialog.showSnackbar(message: AppLocals.addressDeleteSuccess.tr);
        Get.back(result: true);
        break;
      case RequestStatus.noInternet:
        CustomDialog.showSnackbar(message: AppLocals.globalNoInternet.tr);
        break;
      case RequestStatus.failed:
        CustomDialog.showSnackbar(
          message:
              "${AppLocals.globalInternalError.tr} [${result.errorResponse?.status}]",
        );
        break;
      case RequestStatus.somethingWrong:
        CustomDialog.showSnackbar(message: AppLocals.globalSomethingWrong.tr);
        break;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (isOpenAppSettings) {
          isOpenAppSettings = false;
          requestLocationPermission();
        }
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    nameAddressController.dispose();
    phoneNumberController.dispose();
    addressDetailsController.dispose();
    super.onClose();
  }

  void markDefaultAddress() {
    isDefaultAddress = !isDefaultAddress;
    update();
  }
}
