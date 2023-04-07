import 'package:tostinh/domain/entities/body/forgot_password_request_body.dart';
import 'package:tostinh/domain/entities/body/login_request_body.dart';
import 'package:tostinh/domain/entities/body/register_request_body.dart';
import 'package:tostinh/domain/entities/body/update_profile_request_body.dart';
import 'package:tostinh/domain/entities/body/verify_forgot_password_request_body.dart';
import 'package:tostinh/domain/entities/query/verify_otp_query.dart';
import 'package:tostinh/domain/entities/response/verify_otp_response.dart';
import 'package:tostinh/domain/entities/result/forgot_password_result.dart';
import 'package:tostinh/domain/entities/result/login_result.dart';
import 'package:tostinh/domain/entities/result/register_result.dart';
import 'package:tostinh/domain/entities/result/update_profile_result.dart';
import 'package:tostinh/domain/entities/result/verify_forgot_password_result.dart';
import 'package:tostinh/domain/entities/result/verify_otp_result.dart';

abstract class AuthRepository {
  Future<LoginResult> loginWithPhoneNumber({required LoginRequestBody body});
  Future<RegisterResult> register({required RegisterRequestBody body});
  Future<UpdateProfileResult> updateProfile(
      {required UpdateProfileRequestBody body});
  Future<ForgotPasswordResult> forgotPassword(
      {required ForgotPasswordRequestBody body});
  Future<VerifyForgotPasswordResult> verifyForgotPassword(
      {required VerifyForgotPasswordRequestBody body});
  Future<VerifyOtpResult> verifyOtp({required VerifyOtpQuery query});
}
