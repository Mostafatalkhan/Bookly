import 'package:book/core/utils/assets.dart';
import 'package:book/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 28, left: 28.0, top: 40, bottom: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 18,
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.searchView);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 16,
              ))
        ],
      ),
    );
  }
}
