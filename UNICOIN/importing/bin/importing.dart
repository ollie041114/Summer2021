import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import'dart:math';//Random
import'dart:typed_data';//Uint8List     
import'package:web3dart/crypto.dart';

import 'package:web3dart/web3dart.dart' as _i1;
import '../lib/Everything.g.dart';

const String rpcUrl = 'http://127.0.0.1:7545';
const String wsUrl = 'ws://127.0.0.1:7545';

const String privateKey =
    '2ef66fed7d783d267a83902d3223c03d8d7ae6be1e83d3d02bbde697864990f0';

final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0x62E6AD17C0f0c4be01484A946b41A69811fB0131');
final EthereumAddress receiver =
    EthereumAddress.fromHex('0x70470E71e1106Eca98F6F792841886343bB0d4A5');

late final client;

Future<void> main() async {
  // establish a connection to the ethereum rpc node. The socketConnector
  // property allows more efficient event streams over websocket instead of
  // http-polls. However, the socketConnector property is experimental.
  client = Web3Client(rpcUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsUrl).cast<String>();
  });
}

Future<String> enrollUsere(String _name, String _surname, BigInt _id,
      _i1.EthereumAddress _eth_address, bool _isCurator,
      Credentials credentials) async {
    
    Random rng = Random.secure();//secure random number generator
    BigInt privKey = generateNewPrivateKey(rng);//Generate a new private key

    Uint8List pubKey = privateKeyToPublic(privKey);//Deduces the public key from the private key      
    print('public Key => ${bytesToHex(pubKey)}');//Display its hexadecimal string representation
    
    Uint8List address = publicKeyToAddress(pubKey);//Deduces the address from the public key
    String addressHex = bytesToHex(
                      address,//Address byte array
                      include0x:true,//Include 0x prefix
                      forcePadLength: 40//Padded to 40 bytes
                    );
    print('address => ${addressHex}');//Display address

    String privateKey = privKey.toString();
    
    final credentials = await client.credentialsFromPrivateKey(privateKey);
    final ownAddress = await credentials.extractAddress();

    final everything = Everything(address: contractAddr, client: client);
    var _id = new BigInt.from(20182027);

    await everything.enrollUser("Olzhas", "Yessenbayev", _id, ownAddress, true, credentials: credentials);
    await client.dispose();

    return "Dingo!";
  }
