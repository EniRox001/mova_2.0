import 'package:flutter/material.dart';
import 'package:mova/src/onboarding_login_signup/screens/signup.dart';
import 'package:mova/utils/widgets.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/spacings.dart';
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
      appBar: AppBar(),
      body: Padding(
        padding: Pad.padLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                ButtonImages.logo,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 3,
              ),
            ),
            Text(
              SignUpMainStrings.startedString,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            WLogButton(
              icon: ButtonImages.fbIcon,
              text: SignUpMainStrings.fbButtonString,
              onPressed: () {},
            ),
            WLogButton(
              icon: ButtonImages.googleIcon,
              text: SignUpMainStrings.googleButtonString,
              onPressed: () {},
            ),
            WLogButton(
              icon: ButtonImages.appleIcon,
              text: SignUpMainStrings.appleButtonString,
              onPressed: () {},
            ),
            const WDivider(
              text: SignUpMainStrings.dividerTextString,
            ),
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
