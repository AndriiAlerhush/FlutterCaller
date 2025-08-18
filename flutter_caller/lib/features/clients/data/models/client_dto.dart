import 'package:flutter_caller/features/clients/domain/entities/client.dart';

class ClientDTO {
  final String name;
  final String phone;

  ClientDTO({required this.name, required this.phone});

  factory ClientDTO.fromJson(Map<String, dynamic> json) =>
      ClientDTO(name: json['name'], phone: json['phone']);

  Map<String, dynamic> toJson() => {'name': name, 'phone': phone};

  factory ClientDTO.fromEntity(Client client) =>
      ClientDTO(name: client.name, phone: client.phone);

  Client toEntity() => Client(name: name, phone: phone);
}
