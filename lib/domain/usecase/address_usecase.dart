import '../entities/body/address_request_body.dart';
import '../entities/result/address_result.dart';
import '../entities/result/message_result.dart';
import '../repository/address_repository.dart';

class AddressUseCase {
  final AddressRepository _repository;

  AddressUseCase({
    required AddressRepository repository,
  }) : _repository = repository;

  Future<AddressResult> get() async {
    return await _repository.get();
  }

  Future<MessageResult> create({required AddressRequestBody body}) async {
    return await _repository.create(body: body);
  }

  Future<MessageResult> update({
    required int id,
    required AddressRequestBody body,
  }) async {
    return await _repository.update(id: id, body: body);
  }

  Future<MessageResult> delete({required int id}) async {
    return await _repository.delete(id: id);
  }
}
