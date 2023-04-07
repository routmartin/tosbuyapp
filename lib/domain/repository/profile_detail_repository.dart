import 'package:tostinh/domain/entities/result/profile_detail_result.dart';

abstract class ProfileDetailRepository {
  Future<ProfileDetailResult> getProfileDetail();
}
