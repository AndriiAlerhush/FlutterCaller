import 'package:flutter/material.dart';
import 'package:flutter_caller/features/clients/domain/entities/client.dart';
import 'package:flutter_caller/features/clients/presentation/widgets/client_menu_button.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({super.key, required this.client});

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blueGrey,
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.white),
        title: Text(client.name, style: TextStyle(color: Colors.white)),
        subtitle: Text(client.phone, style: TextStyle(color: Colors.white70)),
        trailing: ClientMenuButton(client: client),
        // visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.only(left: 16, right: 0),
      ),
    );
  }
}
