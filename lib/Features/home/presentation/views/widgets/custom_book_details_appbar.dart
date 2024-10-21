import 'package:flutter/material.dart';

class CustonBookDetailsAppBar extends StatelessWidget {
  const CustonBookDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel_outlined)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
      ],
    );
  }
}
