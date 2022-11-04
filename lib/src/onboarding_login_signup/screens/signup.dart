import 'package:flutter/material.dart';
import 'package:mova/src/onboarding_login_signup/screens/signin_pwd.dart';
import 'package:mova/utils/widgets.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/strings.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: Pad.padLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const WMovaLogo(),
            Text(
              SignUpStrings.createString,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            WInputField(
              controller: emailController,
              prefix: Icons.email,
              hintText: SignUpStrings.emailHintString,
            ),
            WInputField(
              controller: passwordController,
              prefix: Icons.lock,
              hintText: SignUpStrings.passwordHintString,
            ),
            WRememberMe(
              isChecked: isChecked,
              text: SignUpStrings.rememberString,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            WLargeButton(
              onPressed: () {},
              buttonText: SignUpStrings.buttonString,
            ),
            const WDivider(text: SignUpStrings.dividerString),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WLogButtonSmall(
                  onPressed: () {},
                  icon: ButtonImages.fbIcon,
                ),
                WLogButtonSmall(
                  onPressed: () {},
                  icon: ButtonImages.googleIcon,
                ),
                WLogButtonSmall(
                  onPressed: () {},
                  icon: ButtonImages.appleIcon,
                ),
              ],
            ),
            WTextSpan(
              textOne: SignUpStrings.altTextOneString,
              textTwo: SignUpStrings.altTextTwoString,
              onPressed: () {
                navigateToPage(context, const SignIn());
              },
            ),
          ],
        ),
      ),
    );
  }
}
