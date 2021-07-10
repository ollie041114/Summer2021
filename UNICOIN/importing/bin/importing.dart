import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import 'token.g.dart';

const String rpcUrl = 'http://127.0.0.1:7545';
const String wsUrl = 'ws://127.0.0.1:7545';

const String privateKey =
    '2ef66fed7d783d267a83902d3223c03d8d7ae6be1e83d3d02bbde697864990f0';

final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0x62E6AD17C0f0c4be01484A946b41A69811fB0131');
final EthereumAddress receiver =
    EthereumAddress.fromHex('0x70470E71e1106Eca98F6F792841886343bB0d4A5');


Future<void> main() async {
  // establish a connection to the ethereum rpc node. The socketConnector
  // property allows more efficient event streams over websocket instead of
  // http-polls. However, the socketConnector property is experimental.
  final client = Web3Client(rpcUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsUrl).cast<String>();
  });
  final credentials = await client.credentialsFromPrivateKey(privateKey);
  final ownAddress = await credentials.extractAddress();

  // read the contract abi and tell web3dart where it's deployed (contractAddr)
  final token = Token(address: contractAddr, client: client);

  // listen for the Transfer event when it's emitted by the contract above
  final subscription = token.transferEvents().take(1).listen((event) {
    print('${event.from} sent ${event.value} MetaCoins to ${event.to}!');
  });

  // check our balance in MetaCoins by calling the appropriate function
  final balance = await token.getBalance(ownAddress);
  print('We have $balance MetaCoins');

  // send all our MetaCoins to the other address by calling the sendCoin
  // function
  await token.sendCoin(receiver, balance, credentials: credentials);

  await subscription.asFuture();
  await subscription.cancel();

  await client.dispose();
}    