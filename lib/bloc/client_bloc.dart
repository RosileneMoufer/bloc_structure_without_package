import 'dart:async';

import 'package:bloc_structure_without_package/bloc/client_event.dart';
import 'package:bloc_structure_without_package/bloc/client_state.dart';
import 'package:bloc_structure_without_package/model/client.dart';
import 'package:bloc_structure_without_package/repository/client_repository.dart';

class ClientBloc {
  final _clientRepository = ClientRepository();

  final StreamController<ClientEvent> _inputClientController =
      StreamController<ClientEvent>();

  final StreamController<ClientState> _outputClientController =
      StreamController<ClientState>();

  // Event de entrada - evento
  Sink<ClientEvent> get inputClient => _inputClientController.sink;

  // Event de saída - evento
  Stream<ClientState> get outputClient => _outputClientController.stream;

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent event) {
    List<Client> clients = [];

    if (event is LoadClientEvent) {
      clients = _clientRepository.loadClients();
    } else if (event is AddClientEvent) {
      clients = _clientRepository.addClient(event.client!);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepository.removeClient(event.client!);
    }

    _outputClientController.add(ClientSccessState(clients: clients));
  }
}
