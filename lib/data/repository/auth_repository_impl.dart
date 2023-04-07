import 'dart:developer';

import 'package:logger/logger.dart';
import 'package:tostinh/data/datasource/api_datasource.dart';
import 'package:tostinh/domain/entities/body/verify_forgot_password_request_body.dart';
import 'package:tostinh/domain/entities/body/update_profile_request_body.dart';
import 'package:tostinh/domain/entities/body/register_request_body.dart';
import 'package:tostinh/domain/entities/body/forgot_password_request_body.dart';
import 'package:tostinh/domain/entities/query/verify_otp_query.dart';
import 'package:tostinh/domain/entities/response/error_response.dart';
import 'package:tostinh/domain/entities/response/login_response.dart';
import 'package:tostinh/domain/entities/response/message_response.dart';
import 'package:tostinh/domain/entities/response/verify_otp_response.dart';
import 'package:tostinh/domain/entities/result/forgot_password_result.dart';
import 'package:tostinh/domain/entities/result/login_result.dart';
import 'package:tostinh/domain/entities/body/login_request_body.dart';
import 'package:tostinh/domain/entities/result/verify_forgot_password_result.dart';
import 'package:tostinh/domain/entities/result/update_profile_result.dart';
import 'package:tostinh/domain/entities/result/register_result.dart';
import 'package:tostinh/domain/entities/result/verify_otp_result.dart';
import 'package:tostinh/domain/repository/auth_repository.dart';
import 'package:tostinh/utils/helper/api_helper.dart';

import '../../base/base_result.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiDataSource _apiDataSource;

  AuthRepositoryImpl({required ApiDataSource apiDataSource})
      : _apiDataSource = apiDataSource;
  @override
  Future<LoginResult> loginWithPhoneNumber(
      {required LoginRequestBody body}) async {
    _apiDataSource.printBody(body.toJson());
    final result = LoginResult();
    final response = await _apiDataSource.login(body: body);
    result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
    try {
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = LoginResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    }on FormatException catch(e){
      _apiDataSource.printErrorService(e.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<ForgotPasswordResult> forgotPassword(
      {required ForgotPasswordRequestBody body}) async {
    final result = ForgotPasswordResult();
    final response = await _apiDataSource.forgotPassword(body: body);
    result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
    try {
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = MessageResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (e) {
      _apiDataSource.printErrorService(e.toString());
    }
    return result;
  }

  @override
  Future<RegisterResult> register({required RegisterRequestBody body}) async {
    final result = RegisterResult();
    final response = await _apiDataSource.register(body: body);
    result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
    try {
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = MessageResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (e) {
      _apiDataSource.printErrorService(e.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<UpdateProfileResult> updateProfile(
      {required UpdateProfileRequestBody body}) async {
    final result = UpdateProfileResult();
    final response = await _apiDataSource.updateProfile(body: body);
    result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
    try {
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = MessageResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (e) {
      _apiDataSource.printErrorService(e.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<VerifyForgotPasswordResult> verifyForgotPassword(
      {required VerifyForgotPasswordRequestBody body}) async {
    final result = VerifyForgotPasswordResult();
    final response = await _apiDataSource.verfyForgotPassword(body: body);
    result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
    try {
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = MessageResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (e) {
      _apiDataSource.printErrorService(e.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }

  @override
  Future<VerifyOtpResult> verifyOtp({required VerifyOtpQuery query}) async {
    final result = VerifyOtpResult();
    final response = await _apiDataSource.verifyOtp(query: query);
    result.requestStatus = ApiHelper.errorHandler(apiResponse: response);
    try {
      switch (result.requestStatus!) {
        case RequestStatus.success:
          result.successResponse = VerifyOtpResponse.fromJson(response.body);
          break;
        case RequestStatus.noInternet:
          break;
        default:
          result.errorResponse = ErrorResponse.fromJson(response.body);
          break;
      }
    } catch (e) {
      _apiDataSource.printErrorService(e.toString());
      result.requestStatus = RequestStatus.somethingWrong;
    }
    return result;
  }
}
