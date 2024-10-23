import 'package:book/Features/Authurization/presentation/views/widgets/custom_text_field.dart';
import 'package:book/Features/home/presentation/views/home_view.dart';
import 'package:book/core/utils/assets.dart';
import 'package:book/core/utils/style.dart';
import 'package:book/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(AssetsData.logo),
          ),
          const SizedBox(
            height: 26,
          ),
          const Text(
            'Login',
            style: StyleText.textStyle30,
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('UserName'),
          ),
          CustomTextField(
            controller: email,
            hint: 'Enter your email',
            icon: Icons.email,
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Password'),
          ),
          CustomTextField(
            controller: password,
            hint: 'Enter your password',
            icon: Icons.remove_red_eye,
          ),
          const SizedBox(
            height: 26,
          ),
          Center(
            child: CustomButton(
                text: 'Login',
                backGroundcolor: Colors.white,
                textcolor: Colors.black,
                borderRadius: BorderRadius.circular(6),
                width: 160,
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('============No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
