import 'package:flutter/material.dart';
import 'package:mova/src/onboarding_login_signup/widgets/onboarding_signup_widgets.dart';
import 'package:mova/src/onboarding_login_signup/widgets/signup_widgets.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/strings.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = true;
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
            Center(
              child: Image.asset(
                SignupImages.mainImage,
                scale: 0.6,
              ),
            ),
            Text(
              SignUpStrings.createString,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const WInputField(
              prefix: Icons.email,
              hintText: SignUpStrings.emailHintString,
            ),
            const WInputField(
              prefix: Icons.lock,
              hintText: SignUpStrings.passwordString,
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class WLogButtonSmall extends StatelessWidget {
  const WLogButtonSmall({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.fadedDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        side: const BorderSide(color: CustomColors.fadedLightColor, width: 1.0),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          icon,
          scale: 1.5,
        ),
      ),
    );
  }
}

class WRememberMe extends StatelessWidget {
  const WRememberMe({
    Key? key,
    required this.isChecked,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final String text;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          checkColor: CustomColors.mainLightColor,
          activeColor: CustomColors.mainRedColor,
          side: const BorderSide(
            color: CustomColors.mainRedColor,
            width: 2.5,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}

class WInputField extends StatelessWidget {
  const WInputField({
    Key? key,
    required this.prefix,
    required this.hintText,
    this.suffixIcon = Icons.nat,
  }) : super(key: key);

  final IconData prefix;
  final String hintText;
  final IconData suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColors.darkerLightColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: CustomColors.fadedDarkColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: CustomColors.mainRedColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        prefixIcon: Icon(
          prefix,
          color: CustomColors.darkerLightColor,
        ),
        suffixIcon: suffixIcon == Icons.nat
            ? const SizedBox()
            : Icon(
                suffixIcon,
                color: CustomColors.darkerLightColor,
              ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColors.darkerLightColor,
        ),
      ),
    );
  }
}
