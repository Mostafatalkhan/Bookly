import 'package:book/Features/Authurization/presentation/views/widgets/custom_text_field.dart';
import 'package:book/core/utils/routes.dart';
import 'package:book/core/utils/style.dart';
import 'package:book/core/widgets/custom_button.dart';
import 'package:book/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  SignUpBody({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              obsecure: true,
              controller: password,
              hint: 'Enter your password ',
              icon: Icons.lock),
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
            padding: EdgeInsets.only(left: widget.size.width * 0.30),
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
                    Navigator.pushReplacementNamed(context, AppRouter.homeView);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showmsgclass()
                          .showmsg(msg: 'The password provided is too weak.');

                      print('');
                    } else if (e.code == 'email-already-in-use') {
                      showmsgclass().showmsg(
                          msg: 'The account already exists for that email.');
                    } else {
                      showmsgclass().showmsg(msg: 'Error happened');
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
