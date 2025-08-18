import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_caller/features/clients/data/models/client_dto.dart';

abstract class ClientRemoteDataSource {
  Stream<List<ClientDTO>> getAll();
  // Future<ClientDTO> add(ClientDTO client);
  // Future<ClientDTO> update(ClientDTO client);
  Future<void> add(ClientDTO client);
  Future<void> update(ClientDTO client);
  Future<void> delete(String phone);
}

class ClientRemoteDataSourceImpl implements ClientRemoteDataSource {
  final FirebaseFirestore firestore;
  CollectionReference<Map<String, dynamic>> get _collection =>
      firestore.collection('clients');

  ClientRemoteDataSourceImpl(this.firestore);

  @override
  Stream<List<ClientDTO>> getAll() {
    return _collection.snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => ClientDTO.fromJson(doc.data())).toList(),
    );
  }

  @override
  Future<void> add(ClientDTO client) async {
    await _collection
        .doc(client.phone)
        .set(client.toJson(), SetOptions(merge: true));
    // final snap = await _collection.doc(client.phone).get();
    // return ClientDTO.fromJson(snap.data()!);
  }

  @override
  Future<void> delete(String phone) async {
    await _collection.doc(phone).delete();
  }

  @override
  Future<void> update(ClientDTO client) async {
    await _collection.doc(client.phone).update(client.toJson());
    // final snap = await _collection.doc(client.phone).get();
    // return ClientDTO.fromJson(snap.data()!);
  }
}
