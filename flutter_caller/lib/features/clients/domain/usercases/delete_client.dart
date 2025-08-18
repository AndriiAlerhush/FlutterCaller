import 'package:flutter_caller/features/clients/domain/repositories/client_repository.dart';

class DeleteClient {
  final ClientRepository repo;

  DeleteClient(this.repo);

  Future<void> call(String phone) => repo.delete(phone);
}
