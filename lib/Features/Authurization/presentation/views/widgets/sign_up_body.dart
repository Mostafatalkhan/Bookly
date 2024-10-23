import 'package:book/Features/Authurization/presentation/views/widgets/custom_text_field.dart';
import 'package:book/core/utils/style.dart';
import 'package:book/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
    required this.size,
  });
  // final formkey = GlobalKey<FormState>();
  final Size size;

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sign Up',
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
            controller: name,
            hint: 'Enter your name',
            icon: Icons.perm_identity,
          ),
          const SizedBox(
            height: 6,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Email'),
          ),
          CustomTextField(
            controller: email,
            hint: 'Enter your Email',
            icon: Icons.email,
          ),
          const SizedBox(
            height: 6,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Password'),
          ),
          CustomTextField(
              controller: password,
              hint: 'Enter your password ',
              icon: Icons.remove_red_eye),
          const SizedBox(
            height: 6,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Phone'),
          ),
          CustomTextField(
            controller: phone,
            hint: 'Enter your phone',
            icon: Icons.phone,
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.30),
            child: CustomButton(
                width: 160,
                text: 'Sign UP',
                backGroundcolor: Colors.white,
                textcolor: Colors.black,
                borderRadius: BorderRadius.circular(6),
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          )
        ],
      ),
    );
  }
}
