import 'package:flutter_caller/features/clients/domain/entities/client.dart';
import 'package:flutter_caller/features/clients/domain/repositories/client_repository.dart';

class GetClients {
  final ClientRepository repo;
  GetClients(this.repo);

  Stream<List<Client>> call() => repo.getAll();
}
