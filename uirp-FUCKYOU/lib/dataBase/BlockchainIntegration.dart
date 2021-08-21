import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import "dart:io";
import'dart:math';//Random
import'dart:typed_data';//Uint8List
import'package:web3dart/crypto.dart';
import 'dart:convert';

import 'package:web3dart/web3dart.dart' as _i1;
import '../Everything.g.dart';
import 'package:flutter/services.dart' show rootBundle;

class BlockchainIntegration with ChangeNotifier{
  Future<String> getContractAddress() async{
    var info = json.decode(await rootBundle.loadString('./assets/Everything.json'));
    return info['networks']['3']['address'].toString();
  }



  // Making it a singleton
  static final BlockchainIntegration _singleton = BlockchainIntegration
      ._internal();

  factory BlockchainIntegration() {
    return _singleton;
  }

  BlockchainIntegration._internal();

  static const String rpcUrl = 'https://ropsten.infura.io/v3/f0bfb8e77bc548f5b2b5ca71b4f86953';
  static const String wsUrl = 'wss://ropsten.infura.io/ws/v3/f0bfb8e77bc548f5b2b5ca71b4f86953';
  var globalPathway;
  static const String privateKey =
      '7ae4495b934af72e8ce1d5792f98c119f1d831690ee27dcfeee4c077d7f4f7b3';

  final EthereumAddress receiver =
  EthereumAddress.fromHex('0x070aE2b66a63De8b4Cd352e725CA81Ed663611F0');

  final client = Web3Client(rpcUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsUrl).cast<String>();
  });

  List<String> removeTabs(List<String> args){
    List<String> toReturn = [];
    args.forEach((element) {
      element = element.replaceAll("/t", "");
      toReturn.add(element);
    });
    return toReturn;
  }


  Future<String> SignUp(String _name, String _surname, String _password,
      String _id, String _email) async {
    // removes all tab characters from strings
    var MyArray = removeTabs([_name, _surname, _password, _id, _email]);
    _name = MyArray[0];
    _surname = MyArray[1];
    _password = MyArray[2];
    _id = MyArray[3];
    _email = MyArray[4];

    try {
      print("Starting the goddamn promise");
      final EthereumAddress contractAddr = await EthereumAddress.fromHex(await getContractAddress());

      print("Contract address is "+contractAddr.toString());




      String password = _email + _password;
      // Or generate a new key randomly
      var rng = new Random.secure();
      EthPrivateKey credentials = EthPrivateKey.createRandom(rng);

      var address = await credentials.extractAddress();
      print(address.hex);

      Wallet wallet = await Wallet.createNew(credentials, password, rng);
      // print(wallet.toJson());

      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Directory directory = await Directory(appDocDirectory.path + '/' + 'dir').create(recursive: true);
      print('Path of New Dir: ' + directory.path);
      String pathway = directory.path;
      globalPathway = pathway;
      var file = new File(pathway + '/file.txt');
      var sink = file.openWrite();
      sink.write(wallet.toJson());

      // Close the IOSink to free system resources.
      sink.close();

      final everything = await Everything(
          address: contractAddr, client: client);

      final genesis_credentials = await client.credentialsFromPrivateKey(
          privateKey);
      final genesis_ownAddress = await genesis_credentials.extractAddress();
      var now = DateTime.now().microsecondsSinceEpoch;
      BigInt hey = BigInt.from(now);
      await everything.enrollUser(
          _name, hey,
          _surname, _email, BigInt.from(int.parse(_id)), address, true,
          credentials: genesis_credentials);
      print(wallet.toJson());
      await client.dispose();
      notifyListeners();
      return "Yes";
    } on Exception catch (_) {
      notifyListeners();
      return "No";
    }
  }


  var GlobalAddress;
  var success = false;
  var GlobalEmail;

  Future<Credentials> createCredentials(String pathway, String password) async {
    Directory directory = await Directory(pathway).create(recursive: true);
// The created directory is returned as a Future.
      print('Path of New Dir: ' + directory.path);
      pathway = directory.path;
      File file = File(pathway + '/file.txt'); // (1)
      //print(file);
      String content = file.readAsStringSync();
      Wallet wallet = Wallet.fromJson(content, password);
      print("Wallet is: ");
      print(wallet);
      Credentials unlocked = wallet.privateKey;
      setGlobalAddress(unlocked);
      return unlocked;
  }

  void setGlobalAddress(Credentials unlocked) async {
    GlobalAddress = await unlocked.extractAddress();
    notifyListeners();
  }

  String getEmail() {
    notifyListeners();
    return GlobalEmail;
  }

  Future<String> LogIn(String _username, String _password) async {
    // removes all tab characters from strings
    var MyArray = removeTabs([_username, _password]);
    _username = MyArray[0];
    _password = MyArray[1];

    GlobalEmail = _username;
    try {
      String password = _username + _password;
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Directory directory = await Directory(appDocDirectory.path + '/' + 'dir').create(recursive: true);

      String pathway = directory.path;
      String content = "2";

      Credentials unlocked = await createCredentials(pathway, password);
      print(unlocked);
      notifyListeners();
      print("Yes!");
      return "Yes";
    } catch (e) {
      print(e);
      notifyListeners();
      return "No";
    }
  }

  void NewBicycle() async {
    print("Starting the goddamn promise");
    final EthereumAddress contractAddr = await EthereumAddress.fromHex(await getContractAddress());

    print("Contract address is "+contractAddr.toString());



    final genesis_credentials = await client.credentialsFromPrivateKey(privateKey);
    final everything = await Everything(address: contractAddr, client: client);
    await everything.enrollBicycle(GlobalAddress, BigInt.from(DateTime.now().microsecondsSinceEpoch),
        credentials: genesis_credentials);
    notifyListeners();
  }
}
