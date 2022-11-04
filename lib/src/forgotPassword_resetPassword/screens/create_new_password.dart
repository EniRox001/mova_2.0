import 'package:flutter/material.dart';
import 'package:mova/src/home_action_menu/screens/home_screen.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/methods.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/strings.dart';
import 'package:mova/utils/widgets.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          CreateNewPasswordStrings.titleString,
        ),
      ),
      body: Padding(
        padding: Pad.padMid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                ForgotPasswordImages.forgotPasswordImageTwo,
                scale: .35,
              ),
            ),
            Text(
              CreateNewPasswordStrings.textString,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            WInputField(
              prefix: Icons.lock,
              controller: passwordController,
              hintText: CreateNewPasswordStrings.passwordHintString,
            ),
            WInputField(
              prefix: Icons.lock,
              controller: confirmPasswordController,
              hintText: CreateNewPasswordStrings.confirmPasswordHintString,
            ),
            WRememberMe(
              isChecked: isChecked,
              text: CreateNewPasswordStrings.rememberString,
              onChanged: (bool? value) {
                setState(
                  () {
                    isChecked = value!;
                  },
                );
              },
            ),
            WLargeButton(
              onPressed: () {
                mShowCongratulations(context);
                Future.delayed(const Duration(seconds: 3), () {
                  navigateToPage(context, const HomeScreen());
                });
              },
              buttonText: CreateNewPasswordStrings.continueButtonString,
            ),
          ],
        ),
      ),
    );
  }
}
