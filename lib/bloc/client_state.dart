import 'package:bloc_structure_without_package/model/client.dart';

abstract class ClientState {
  List<Client>? clients;

  ClientState({
    required this.clients,
  });
}

class ClientInitialState extends ClientState {
  ClientInitialState() : super(clients: []);
}

class ClientSccessState extends ClientState {
  ClientSccessState({required List<Client>? clients}) : super(clients: clients);
}
