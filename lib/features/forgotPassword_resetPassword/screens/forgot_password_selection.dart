import 'package:flutter/material.dart';
import 'package:mova/features/forgotPassword_resetPassword/screens/forgot_password_pin.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/strings.dart';
import 'package:mova/utils/widgets.dart';

class ForgotPasswordSelection extends StatefulWidget {
  const ForgotPasswordSelection({super.key});

  @override
  State<ForgotPasswordSelection> createState() =>
      _ForgotPasswordSelectionState();
}

class _ForgotPasswordSelectionState extends State<ForgotPasswordSelection> {
  int selectedOption = 1;

  void setSelectedOption(int i) {
    setState(() {
      selectedOption = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ForgotPasswordSelectionStrings.titleString),
      ),
      body: Padding(
        padding: Pad.padMid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                ForgotPasswordImages.forgotPasswordImageOne,
                scale: .35,
              ),
            ),
            Text(
              ForgotPasswordSelectionStrings.textString,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            WSelectOptions(
              color: selectedOption == 1
                  ? CustomColors.mainRedColor
                  : Colors.transparent,
              icon: Icons.message,
              title: ForgotPasswordSelectionStrings.smsTitle,
              text: ForgotPasswordSelectionStrings.smsText,
              onPressed: () {
                setSelectedOption(1);
              },
            ),
            WSelectOptions(
              color: selectedOption == 2
                  ? CustomColors.mainRedColor
                  : Colors.transparent,
              icon: Icons.mail,
              title: ForgotPasswordSelectionStrings.emailTitle,
              text: ForgotPasswordSelectionStrings.emailText,
              onPressed: () {
                setSelectedOption(2);
              },
            ),
            WLargeButton(
              onPressed: () {
                navigateToPage(context, const ForgotPasswordPin());
              },
              buttonText: ForgotPasswordSelectionStrings.continueButtonString,
            )
          ],
        ),
      ),
    );
  }
}

class WSelectOptions extends StatelessWidget {
  const WSelectOptions({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String title;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.fadedDarkColor,
          border: Border.all(
            color: color,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF2F202A),
                radius: 30.0,
                child: Icon(
                  icon,
                  color: CustomColors.mainRedColor,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(text),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
