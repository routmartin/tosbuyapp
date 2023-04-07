import 'package:tostinh/data/datasource/api_datasource.dart';
import 'package:tostinh/domain/entities/response/error_response.dart';
import 'package:tostinh/domain/entities/response/profile_detail_response.dart';
import 'package:tostinh/domain/entities/result/profile_detail_result.dart';
import 'package:tostinh/domain/repository/profile_detail_repository.dart';
import 'package:tostinh/utils/helper/api_helper.dart';

import '../../base/base_result.dart';

class ProfileDetailRepositoryImpl extends ProfileDetailRepository {
  final ApiDataSource apiDataSource;

  ProfileDetailRepositoryImpl({required this.apiDataSource});

  @override
  Future<ProfileDetailResult> getProfileDetail() async {
    final result = ProfileDetailResult();
    try {
      final apiResponse = await apiDataSource.getProfileDetail();
      result.requestStatus = ApiHelper.errorHandler(apiResponse: apiResponse);
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse =
              ProfileDetailResponse.fromJson(apiResponse.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(apiResponse.body);
          break;
      }
    } catch (e) {
      apiDataSource.printErrorService(e.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }
}
