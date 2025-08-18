import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/client.dart';
import '../clients_view_model.dart';

enum ClientMenuAction { edit, delete, call }

class ClientMenuButton extends StatelessWidget {
  final Client client;
  const ClientMenuButton({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ClientMenuAction>(
      tooltip: 'More',
      icon: const Icon(Icons.more_vert),
      onSelected: (action) {
        switch (action) {
          case ClientMenuAction.edit:
            _showEditDialog(context, client);
            break;
          case ClientMenuAction.delete:
            _confirmDelete(context, client);
            break;
          case ClientMenuAction.call:
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Call ${client.phone}')));
            break;
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: ClientMenuAction.edit,
          child: ListTile(leading: Icon(Icons.edit), title: Text('Edit')),
        ),
        PopupMenuItem(
          value: ClientMenuAction.delete,
          child: ListTile(
            leading: Icon(Icons.delete_outline),
            title: Text('Delete'),
          ),
        ),
        PopupMenuItem(
          value: ClientMenuAction.call,
          child: ListTile(leading: Icon(Icons.phone), title: Text('Call')),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext context, Client client) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete client?'),
        content: Text('Do you really want to delete ${client.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (ok == true) {
      await context.read<ClientsViewModel>().delete(client);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${client.name} deleted')));
    }
  }

  void _showEditDialog(BuildContext context, Client client) {
    final nameCtrl = TextEditingController(text: client.name);
    final phoneCtrl = TextEditingController(text: client.phone);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit client'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              await context.read<ClientsViewModel>().update(
                Client(
                  name: nameCtrl.text.trim(),
                  phone: phoneCtrl.text.trim(),
                ),
              );
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
