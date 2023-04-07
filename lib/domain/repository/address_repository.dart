import '../entities/body/address_request_body.dart';
import '../entities/result/address_result.dart';
import '../entities/result/message_result.dart';

abstract class AddressRepository {
  Future<MessageResult> create({required AddressRequestBody body});

  Future<AddressResult> get();

  Future<MessageResult> update(
      {required int id, required AddressRequestBody body});

  Future<MessageResult> delete({required int id});
}
