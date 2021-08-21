import 'package:flutter/material.dart';
import 'package:uirp/components/textField.dart';

import '../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() =>
      _RoundedPasswordFieldState(onChanged, controller);
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  bool isHidden = true;
  _RoundedPasswordFieldState(this.onChanged, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            controller: this.controller,
            obscureText: isHidden,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "password",
              icon: Icon(
                Icons.lock,
                color: primaryColor,
              ),
              suffixIcon: IconButton(
                icon: (isHidden)
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: togglePasswordVisibility,
                color: primaryColor,
              ),
              border: InputBorder.none,
            )));
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
