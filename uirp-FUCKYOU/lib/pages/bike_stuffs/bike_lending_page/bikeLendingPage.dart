import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bodyBikeLending.dart';

/**
 * MAY NEED THESE REQUIRED VARIABLES:
 * - History of the bike lending.
 * - User's profile.
 */

class BikeLendingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBikeLending(
        key
      ),
    );
  }
}