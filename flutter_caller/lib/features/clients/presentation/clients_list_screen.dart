import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_caller/features/clients/presentation/clients_view_model.dart';
import 'package:flutter_caller/features/clients/presentation/widgets/clients_list.dart';
import 'package:flutter_caller/features/clients/presentation/widgets/search_field.dart';

class ClientsListScreen extends StatelessWidget {
  const ClientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ClientsViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Clients',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SearchField(),
        ),
      ),
      body: Container(
        color: Colors.white70,
        child: vm.loading
            ? const Center(child: CircularProgressIndicator())
            : ClientsList(clients: vm.clients),
      ),
    );
  }
}
