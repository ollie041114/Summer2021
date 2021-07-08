import 'dart:convert';
//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://127.0.0.1:7545";
  final String _wsUrl = "ws://127.0.0.1:7545/";
  final String _privateKey = "704f7c39ce14598ec0c265fd2a97d73534e222643ac97034efff52a0c0f7821c";


  late Web3Client _client;
  late bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _countryName;
  late ContractFunction _currentPopulation;
  late ContractFunction _set;
  late ContractFunction _decrement;
  late ContractFunction _increment;

  late String countryName;
  late String currentPopulation;

  ContractLinking() {

    initialSetup();
  }


  initialSetup() async {

// establish a connection to the ethereum rpc node. The socketConnector
// property allows more efficient event streams over websocket instead of
// http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {

// Reading the contract abi
    final abiStringFile =
    await rootBundle.loadString("src/artifacts/Population.json");
    final jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {

// Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Population"), _contractAddress);

// Extracting the functions, declared in contract.
    _countryName = _contract.function("countryName");
    _currentPopulation = _contract.function("currentPopulation");
    _set = _contract.function("set");
    _decrement = _contract.function("decrement");
    _increment = _contract.function("increment");

    getData();
  }

  getData() async {

// Getting the current name and population declared in the smart contract.
    List name = await _client
        .call(contract: _contract, function: _countryName, params: []);
    List population = await _client
        .call(contract: _contract, function: _currentPopulation, params: []);
    countryName = name[0];
    currentPopulation = population[0].toString();
    print("$countryName , $currentPopulation");
    isLoading = false;
    notifyListeners();
  }

  addData(String nameData, BigInt countData) async {

// Setting the countryName and currentPopulation defined by the user
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _set,
            parameters: [nameData, countData]));
    getData();
  }

  increasePopulation(int incrementBy) async {

// Increasing the currentPopulation
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _increment,
            parameters: [BigInt.from(incrementBy)]));
    getData();
  }

  decreasePopulation(int decrementBy) async {

// Decreasing the currentPopulation
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _decrement,
            parameters: [BigInt.from(decrementBy)]));
    getData();
  }

}
