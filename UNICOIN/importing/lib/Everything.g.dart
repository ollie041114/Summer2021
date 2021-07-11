// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;

class Everything extends _i1.GeneratedContract {
  Everything(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(
            _i1.DeployedContract(
                _i1.ContractAbi.fromJson(
                    '[{"inputs":[{"internalType":"address","name":"_UNICOINaddress","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"string","name":"_name","type":"string"},{"internalType":"string","name":"_surname","type":"string"},{"internalType":"uint256","name":"_id","type":"uint256"},{"internalType":"address","name":"_eth_address","type":"address"},{"internalType":"bool","name":"_isCurator","type":"bool"}],"name":"enrollUser","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_owner","type":"address"}],"name":"enrollBicycle","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
                    'Everything'),
                address),
            client,
            chainId);

  Future<String> enrollUser(String _name, String _surname, BigInt _id,
      _i1.EthereumAddress _eth_address, bool _isCurator,
      {required _i1.Credentials credentials}) async {
    final function = self.function('enrollUser');
    final params = [_name, _surname, _id, _eth_address, _isCurator];
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
}