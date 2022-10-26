import 'package:flutter/material.dart';
import 'package:mova/src/onboarding_login_signup/screens/signup.dart';
import 'package:mova/src/onboarding_login_signup/widgets/onboarding_signup_widgets.dart';

class SignupMain extends StatefulWidget {
  const SignupMain({super.key});

  @override
  State<SignupMain> createState() => _SignupMainState();
}

class _SignupMainState extends State<SignupMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo_two.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            const Text(
              'Let\'s get you started',
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            WLogButton(
              icon: 'assets/icons/fb_icon.png',
              text: 'Continue with Facebook',
              onPressed: () {},
            ),
            WLogButton(
              icon: 'assets/icons/google_logo.png',
              text: 'Continue with Google',
              onPressed: () {},
            ),
            WLogButton(
              icon: 'assets/icons/apple_logo.png',
              text: 'Continue with Apple',
              onPressed: () {},
            ),
            const WDivider(),
            WLargeButton(
              onPressed: () {},
              buttonText: 'Sign in with Password',
            ),
            WTextSpan(
              textOne: 'Don\'t have an account ',
              textTwo: 'Sign up',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
