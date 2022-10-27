import 'package:flutter/material.dart';
import 'package:mova/src/onboarding_login_signup/screens/signup.dart';
import 'package:mova/src/onboarding_login_signup/widgets/onboarding_signup_widgets.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/strings.dart';

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
                SignUpImages.logo,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 3,
              ),
            ),
            const Text(
              SignUpMainStrings.startedString,
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            WLogButton(
              icon: SignUpImages.fbIcon,
              text: SignUpMainStrings.fbButtonString,
              onPressed: () {},
            ),
            WLogButton(
              icon: SignUpImages.googleIcon,
              text: SignUpMainStrings.googleButtonString,
              onPressed: () {},
            ),
            WLogButton(
              icon: SignUpImages.appleIcon,
              text: SignUpMainStrings.appleButtonString,
              onPressed: () {},
            ),
            const WDivider(),
            WLargeButton(
              onPressed: () {},
              buttonText: SignUpMainStrings.buttonString,
            ),
            WTextSpan(
              textOne: SignUpMainStrings.altTextOneString,
              textTwo: SignUpMainStrings.altTextTwoString,
              onPressed: () {
                navigateToPage(context, const SignUp());
              },
            )
          ],
        ),
      ),
    );
  }
}
