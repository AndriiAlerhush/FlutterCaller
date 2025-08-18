import 'package:flutter/material.dart';
import 'package:flutter_caller/features/clients/domain/entities/client.dart';
import 'package:flutter_caller/features/clients/presentation/widgets/client_card.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({super.key, required this.clients});

  final List<Client> clients;

  @override
  Widget build(BuildContext context) {
    if (clients.isEmpty) {
      return const Center(
        child: Text(
          "No clients found",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return ListView.separated(
      itemCount: clients.length,
      padding: const EdgeInsets.all(12),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 4);
      },
      itemBuilder: (BuildContext context, int index) {
        return ClientCard(client: clients[index]);
      },
    );
  }
}
