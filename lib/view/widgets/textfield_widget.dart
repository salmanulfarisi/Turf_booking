import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hint,
    required this.validator,
    required this.controller,
    required this.keybord,
    required this.icon,
    this.suffIcon,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType keybord;
  final String hint;
  final String validator;
  final Widget? suffIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // obscureText: Provider.of<LoginViewModel>(context, listen: true).obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        suffixIcon: suffIcon,
      ),
      keyboardType: keybord,
    );
  }
}
