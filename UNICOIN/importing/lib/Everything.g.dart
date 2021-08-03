// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

class Everything extends _i1.GeneratedContract {
  Everything(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(
            _i1.DeployedContract(
                _i1.ContractAbi.fromJson(
                    '[{"inputs":[{"internalType":"address","name":"_UNICOINaddress","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"_owner","type":"address"},{"indexed":false,"internalType":"bytes32","name":"BicycleId","type":"bytes32"}],"name":"NewBicycle","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"transactionID","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"Openlatitude","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"Openlongitude","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"Closelatitude","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"Closelongitude","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"openTimestamp","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"closeTimestamp","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"fee_rate","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"totalFee","type":"uint256"},{"indexed":false,"internalType":"address","name":"borrower","type":"address"},{"indexed":false,"internalType":"address","name":"lender","type":"address"}],"name":"NewTransaction","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"string","name":"_name","type":"string"},{"indexed":false,"internalType":"string","name":"_surname","type":"string"},{"indexed":false,"internalType":"string","name":"_email","type":"string"},{"indexed":false,"internalType":"uint256","name":"_id","type":"uint256"},{"indexed":false,"internalType":"address","name":"_eth_address","type":"address"},{"indexed":false,"internalType":"bool","name":"_isCurator","type":"bool"}],"name":"NewUser","type":"event"},{"inputs":[{"internalType":"string","name":"_name","type":"string"},{"internalType":"string","name":"_surname","type":"string"},{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256","name":"_id","type":"uint256"},{"internalType":"address","name":"_eth_address","type":"address"},{"internalType":"bool","name":"_isCurator","type":"bool"}],"name":"enrollUser","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_owner","type":"address"}],"name":"enrollBicycle","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_latitude","type":"uint256"},{"internalType":"uint256","name":"_longitude","type":"uint256"},{"internalType":"uint256","name":"_timeStamp","type":"uint256"},{"internalType":"string","name":"_location","type":"string"},{"internalType":"address","name":"_borrower","type":"address"},{"internalType":"address","name":"_owner","type":"address"},{"internalType":"bytes32","name":"_bicycle_number","type":"bytes32"}],"name":"openBicycleTransaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_latitude","type":"uint256"},{"internalType":"uint256","name":"_longitude","type":"uint256"},{"internalType":"uint256","name":"_timeStamp","type":"uint256"},{"internalType":"address","name":"_owner","type":"address"},{"internalType":"bytes32","name":"_bicycle_number","type":"bytes32"}],"name":"closeBicycleTransaction","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
                    'Everything'),
                address),
            client,
            chainId);

  Future<String> enrollUser(String _name, String _surname, String _email,
      BigInt _id, _i1.EthereumAddress _eth_address, bool _isCurator,
      {required _i1.Credentials credentials}) async {
    final function = self.function('enrollUser');
    final params = [_name, _surname, _email, _id, _eth_address, _isCurator];
    final transaction = _i1.Transaction.callContract(
        contract: self, function: function, parameters: params);
    return write(credentials, transaction);
  }

  Future<String> enrollBicycle(_i1.EthereumAddress _owner,
      {required _i1.Credentials credentials}) async {
    final function = self.function('enrollBicycle');
    final params = [_owner];
    final transaction = _i1.Transaction.callContract(
        contract: self, function: function, parameters: params);
    return write(credentials, transaction);
  }

  Future<String> openBicycleTransaction(
      BigInt _latitude,
      BigInt _longitude,
      BigInt _timeStamp,
      String _location,
      _i1.EthereumAddress _borrower,
      _i1.EthereumAddress _owner,
      _i2.Uint8List _bicycle_number,
      {required _i1.Credentials credentials}) async {
    final function = self.function('openBicycleTransaction');
    final params = [
      _latitude,
      _longitude,
      _timeStamp,
      _location,
      _borrower,
      _owner,
      _bicycle_number
    ];
    final transaction = _i1.Transaction.callContract(
        contract: self, function: function, parameters: params);
    return write(credentials, transaction);
  }

  Future<String> closeBicycleTransaction(
      BigInt _latitude,
      BigInt _longitude,
      BigInt _timeStamp,
      _i1.EthereumAddress _owner,
      _i2.Uint8List _bicycle_number,
      {required _i1.Credentials credentials}) async {
    final function = self.function('closeBicycleTransaction');
    final params = [_latitude, _longitude, _timeStamp, _owner, _bicycle_number];
    final transaction = _i1.Transaction.callContract(
        contract: self, function: function, parameters: params);
    return write(credentials, transaction);
  }

  /// Returns a live stream of all NewBicycle events emitted by this contract.
  Stream<NewBicycle> newBicycleEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('NewBicycle');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return NewBicycle(decoded);
    });
  }

  /// Returns a live stream of all NewTransaction events emitted by this contract.
  Stream<NewTransaction> newTransactionEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('NewTransaction');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return NewTransaction(decoded);
    });
  }

  /// Returns a live stream of all NewUser events emitted by this contract.
  Stream<NewUser> newUserEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('NewUser');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return NewUser(decoded);
    });
  }
}

class NewBicycle {
  NewBicycle(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        BicycleId = (response[1] as _i2.Uint8List);

  final _i1.EthereumAddress owner;

  final _i2.Uint8List BicycleId;
}

class NewTransaction {
  NewTransaction(List<dynamic> response)
      : transactionID = (response[0] as BigInt),
        Openlatitude = (response[1] as BigInt),
        Openlongitude = (response[2] as BigInt),
        Closelatitude = (response[3] as BigInt),
        Closelongitude = (response[4] as BigInt),
        openTimestamp = (response[5] as BigInt),
        closeTimestamp = (response[6] as BigInt),
        feerate = (response[7] as BigInt),
        totalFee = (response[8] as BigInt),
        borrower = (response[9] as _i1.EthereumAddress),
        lender = (response[10] as _i1.EthereumAddress);

  final BigInt transactionID;

  final BigInt Openlatitude;

  final BigInt Openlongitude;

  final BigInt Closelatitude;

  final BigInt Closelongitude;

  final BigInt openTimestamp;

  final BigInt closeTimestamp;

  final BigInt feerate;

  final BigInt totalFee;

  final _i1.EthereumAddress borrower;

  final _i1.EthereumAddress lender;
}

class NewUser {
  NewUser(List<dynamic> response)
      : name = (response[0] as String),
        surname = (response[1] as String),
        email = (response[2] as String),
        id = (response[3] as BigInt),
        ethaddress = (response[4] as _i1.EthereumAddress),
        isCurator = (response[5] as bool);

  final String name;

  final String surname;

  final String email;

  final BigInt id;

  final _i1.EthereumAddress ethaddress;

  final bool isCurator;
}
