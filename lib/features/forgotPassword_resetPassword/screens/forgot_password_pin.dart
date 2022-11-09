import 'package:flutter/material.dart';
import 'package:mova/features/forgotPassword_resetPassword/screens/create_new_password.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/strings.dart';
import 'package:mova/utils/widgets.dart';

class ForgotPasswordPin extends StatefulWidget {
  const ForgotPasswordPin({super.key});

  @override
  State<ForgotPasswordPin> createState() => _ForgotPasswordPinState();
}

class _ForgotPasswordPinState extends State<ForgotPasswordPin> {
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ForgotPasswordPinStrings.titleString,
        ),
      ),
      body: Padding(
        padding: Pad.padMid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text(
                  '${ForgotPasswordPinStrings.textString} ${ForgotPasswordSelectionStrings.smsText}'),
            ),
            WPinCodeField(
              controller: pinController,
              onChanged: (v) {},
            ),
            const WTextSpanExt(
              textOne: ForgotPasswordPinStrings.resendCodeStringOne,
              textTwo: ForgotPasswordPinStrings.resendCodeStringTwo,
              textThree: ForgotPasswordPinStrings.resendCodeStringThree,
            ),
            WLargeButton(
              onPressed: () {
                navigateToPage(context, const CreateNewPassword());
              },
              buttonText: ForgotPasswordPinStrings.verifyButtonText,
            ),
          ],
        ),
      ),
    );
  }
}
