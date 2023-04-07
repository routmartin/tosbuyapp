import 'package:get/get.dart';
import 'package:tostinh/data/repository/auth_repository_impl.dart';
import 'package:tostinh/data/repository/profile_detail_respository_impl.dart';
import 'package:tostinh/domain/repository/auth_repository.dart';
import 'package:tostinh/domain/repository/profile_detail_repository.dart';
import 'package:tostinh/domain/usecase/auth_usecase.dart';
import 'package:tostinh/domain/usecase/profile_detail_usecase.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepositoryImpl(apiDataSource: Get.find()));
    Get.put<ProfileDetailRepository>(
      ProfileDetailRepositoryImpl(
        apiDataSource: Get.find(),
      ),
    );
    Get.put(AuthUseCase(authRepository: Get.find()));
    Get.put(ProfileDetailUseCase(profileDetailRepository: Get.find()));
  }
}
