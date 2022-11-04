import 'package:flutter/material.dart';
import 'package:mova/src/account_setup/screens/choose_interest.dart';
import 'package:mova/utils/widgets.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/strings.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Pad.padMid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const WMovaLogo(),
            Text(
              SignInStrings.loginString,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            WInputField(
                controller: emailController,
                prefix: Icons.email,
                hintText: SignInStrings.emailHintString),
            WInputField(
                controller: passwordController,
                prefix: Icons.lock,
                hintText: SignInStrings.passwordHintString),
            WRememberMe(
              isChecked: isChecked,
              text: SignInStrings.rememberString,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            WLargeButton(
              onPressed: () {
                navigateToPage(context, const ChooseInterest());
              },
              buttonText: SignInStrings.buttonString,
            ),
            WForgotPassword(
              onPressed: () {},
              text: SignInStrings.forgotPasswordString,
            ),
            const WDivider(text: SignInStrings.dividerString),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WLogButtonSmall(onPressed: () {}, icon: ButtonImages.fbIcon),
                WLogButtonSmall(
                    onPressed: () {}, icon: ButtonImages.googleIcon),
                WLogButtonSmall(onPressed: () {}, icon: ButtonImages.appleIcon),
              ],
            ),
            WTextSpan(
              textOne: SignInStrings.altTextOneString,
              textTwo: SignInStrings.altTextTwoString,
              onPressed: () {
                navigateBack(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
