import 'package:flutter_caller/features/clients/domain/entities/client.dart';
import 'package:flutter_caller/features/clients/domain/repositories/client_repository.dart';

class AddClient {
  final ClientRepository repo;
  AddClient(this.repo);

  Future<void> call(Client client) => repo.add(client);
}
