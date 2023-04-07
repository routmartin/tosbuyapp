import 'package:tostinh/domain/entities/body/login_request_body.dart';
import 'package:tostinh/domain/entities/body/register_request_body.dart';
import 'package:tostinh/domain/entities/result/login_result.dart';
import 'package:tostinh/domain/entities/result/register_result.dart';
import 'package:tostinh/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<LoginResult> loginWithPhoneNumber(
      {required LoginRequestBody body}) async {
    return await _authRepository.loginWithPhoneNumber(body: body);
  }

  Future<RegisterResult> register({required RegisterRequestBody body}) async {
    return await _authRepository.register(body: body);
  }
}
