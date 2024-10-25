import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.icon,
    super.key,
    this.obsecure,
  });
  final bool? obsecure;
  final String? hint;
  final IconData? icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure ?? false,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Mustn`t be empty';
      //   }
      //   return null;
      // },
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white60),
              borderRadius: BorderRadius.circular(6)),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
    );
  }
}
