// ignore_for_file: file_names

import 'package:get_storage/get_storage.dart';
import 'package:tostinh/domain/entities/response/profile_detail_response.dart';

class AppProfileSharedPref {
  static final _box = GetStorage();
  static const _keyProfileDetail = "_keyProfileDetail";

 set setProfileDetail(ProfileDetailResponse profileDetailResponse) {
    try {
      _box.write(_keyProfileDetail, profileDetailResponse.toJson());
      // ignore: empty_catches
    } catch (e) {}
  }

   ProfileDetailResponse? get getProfileDetail {
    try {
      return ProfileDetailResponse.fromJson(_box.read(_keyProfileDetail));
    } catch (e) {
      return null;
    }
  }
}
