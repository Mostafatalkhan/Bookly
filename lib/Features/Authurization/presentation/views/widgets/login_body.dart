import 'package:book/Features/Authurization/presentation/views/widgets/custom_text_field.dart';
import 'package:book/Features/home/presentation/views/home_view.dart';
import 'package:book/core/utils/assets.dart';
import 'package:book/core/utils/routes.dart';
import 'package:book/core/utils/style.dart';
import 'package:book/core/widgets/custom_button.dart';
import 'package:book/errors/failure.dart';
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
            obsecure: true,
            controller: password,
            hint: 'Enter your password',
            icon: Icons.lock,
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
                    if (e.code == 'invalid-credential') {
                      showmsgclass()
                          .showmsg(msg: 'Email or Password incorrect');

                      print('=======${e.code}');
                    } else {
                      showmsgclass()
                          .showmsg(msg: 'Email or Password incorrect');
                    }
                    // print('Failed with error code: ${e.code}');
                    // print(e.message);
                  }
                }),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  // style: ButtonStyle(
                  //     backgroundColor: WidgetStateProperty.all(Colors.black)),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.signup);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
