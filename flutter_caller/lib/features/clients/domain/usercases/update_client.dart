import 'package:flutter_caller/features/clients/domain/entities/client.dart';
import 'package:flutter_caller/features/clients/domain/repositories/client_repository.dart';

class UpdateClient {
  final ClientRepository repo;

  UpdateClient(this.repo);

  Future<void> call(Client client) => repo.update(client);
}
