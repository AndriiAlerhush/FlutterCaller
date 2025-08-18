import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_caller/features/clients/domain/entities/client.dart';
import 'package:flutter_caller/features/clients/domain/usercases/add_client.dart';
import 'package:flutter_caller/features/clients/domain/usercases/delete_client.dart';
import 'package:flutter_caller/features/clients/domain/usercases/get_clients.dart';
import 'package:flutter_caller/features/clients/domain/usercases/update_client.dart';

class ClientsViewModel extends ChangeNotifier {
  final GetClients getClients;
  final AddClient addClient;
  final UpdateClient updateClient;
  final DeleteClient deleteClient;

  List<Client> _clients = [];
  bool _loading = false;
  StreamSubscription<List<Client>>? _subscription;

  List<Client> get clients => _clients;
  bool get loading => _loading;

  ClientsViewModel({
    required this.getClients,
    required this.addClient,
    required this.updateClient,
    required this.deleteClient,
  });

  void init() {
    _loading = true;
    notifyListeners();

    _subscription = getClients().listen(
      (data) {
        _clients = data;
        _loading = false;
        notifyListeners();
      },
      onError: (e) {
        _loading = false;
        notifyListeners();
        debugPrint('Clients stream error: $e');
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  // Future<void> loadClients() async {
  //   _loading = true;
  //   notifyListeners();
  //   _clients = getClients() as List<Client>;
  //   _loading = false;
  //   notifyListeners();
  // }

  Future<void> add(Client client) async {
    await addClient(client);
    // await loadClients();
  }

  Future<void> update(Client client) async {
    await updateClient(client);
    // await loadClients();
  }

  Future<void> delete(Client client) async {
    await deleteClient(client.phone);
    // await loadClients();
  }
}
