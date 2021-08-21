import 'package:flutter/material.dart';
import 'package:uirp/components/textField.dart';

class RoundedField extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final Icon icon;
  final TextEditingController controller;

  const RoundedField({
    Key? key,
    required this.hint,
    required this.onChanged,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            controller: this.controller,
            decoration: InputDecoration(
              icon: icon,
              hintText: hint,
              border: InputBorder.none,
              // errorText: this.validate ? 'Value can\'t be empty' : null,
            )));
  }
}
