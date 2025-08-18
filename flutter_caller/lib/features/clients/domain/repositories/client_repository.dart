import 'package:flutter_caller/features/clients/domain/entities/client.dart';

abstract class ClientRepository {
  Stream<List<Client>> getAll();
  // Future<Client> add(Client client);
  // Future<Client> update(Client client);
  Future<void> add(Client client);
  Future<void> update(Client client);
  Future<void> delete(String phone);
}
