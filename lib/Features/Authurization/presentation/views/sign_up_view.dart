import 'package:book/Features/Authurization/presentation/views/widgets/sign_up_body.dart';

import 'package:flutter/material.dart';

class SignUP extends StatelessWidget {
  const SignUP({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SignUpBody(size: size),
      ),
    );
  }
}
