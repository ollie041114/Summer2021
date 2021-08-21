import 'package:flutter/material.dart';
import 'package:uirp/pages/email_verification/body.dart';

class EmailVerification extends StatelessWidget {
  final String email;

  const EmailVerification({Key? key, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(email: email),
    );
  }
}
