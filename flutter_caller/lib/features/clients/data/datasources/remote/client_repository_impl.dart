import 'package:flutter_caller/features/clients/data/datasources/remote/client_remote_data_source.dart';
import 'package:flutter_caller/features/clients/data/models/client_dto.dart';
import 'package:flutter_caller/features/clients/domain/entities/client.dart';
import 'package:flutter_caller/features/clients/domain/repositories/client_repository.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientRemoteDataSource remote;
  // final FirebaseFirestore firestore;

  ClientRepositoryImpl(this.remote);

  @override
  Stream<List<Client>> getAll() {
    return remote.getAll().map(
      (dtos) => dtos.map((dto) => dto.toEntity()).toList(),
    );
  }

  @override
  Future<void> add(Client client) async {
    await remote.add(ClientDTO.fromEntity(client));
  }

  @override
  Future<void> update(Client client) async {
    await remote.update(ClientDTO.fromEntity(client));
  }

  @override
  Future<void> delete(String phone) async {
    await remote.delete(phone);
  }
}
