import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/BlockchainIntegration.dart';
import 'package:uirp/dataBase/leUser.dart';
import 'package:uirp/providers/balance.dart';
import 'bodyBikeManager.dart';

/**
 * MAY NEED THESE REQUIRED VARIABLES:
 * - History of the bike lending.
 * - User's profile.
 */

class BikeManagerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var email = Provider.of<BlockchainIntegration>(context, listen: false).getEmail();
    return
      MultiProvider(
          providers: [
            ChangeNotifierProvider<Balance>(create: (context) => Balance()),
            ChangeNotifierProvider<LeUser>(create: (context) => LeUser(email, context)),
          ],
          child:  MaterialApp(
          home: BodyBikeManager(),)
          );
  }
}