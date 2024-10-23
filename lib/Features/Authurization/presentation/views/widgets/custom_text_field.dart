import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.icon,
    super.key,
  });
  final String? hint;
  final IconData? icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Mustn`t be empty';
      //   }
      //   return null;
      // },
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white60),
              borderRadius: BorderRadius.circular(6)),
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white60),
              borderRadius: BorderRadius.circular(6)),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white60),
              borderRadius: BorderRadius.circular(6))),
    );
  }
}
