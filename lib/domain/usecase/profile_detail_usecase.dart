import 'package:tostinh/domain/entities/result/profile_detail_result.dart';
import 'package:tostinh/domain/repository/profile_detail_repository.dart';

class ProfileDetailUseCase {
  final ProfileDetailRepository _profileDetailRepository;

  ProfileDetailUseCase({required ProfileDetailRepository profileDetailRepository}):_profileDetailRepository = profileDetailRepository;

  Future<ProfileDetailResult> profileDetail() async {
    return await _profileDetailRepository.getProfileDetail();
  }
}
