import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mova/utils/colors.dart';

class WLogButton extends StatelessWidget {
  const WLogButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: CustomColors.fadedDarkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          side: const BorderSide(
            color: CustomColors.fadedLightColor,
          )),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              scale: 1.6,
            ),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class WTextSpan extends StatelessWidget {
  const WTextSpan({
    Key? key,
    required this.textOne,
    required this.textTwo,
    required this.onPressed,
  }) : super(key: key);

  final String textOne;
  final String textTwo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: textOne, style: Theme.of(context).textTheme.subtitle2),
          TextSpan(
            text: textTwo,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: CustomColors.mainRedColor,
                ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          )
        ],
      ),
    );
  }
}

class WDivider extends StatelessWidget {
  const WDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
            child: Divider(
          thickness: 1.2,
          color: CustomColors.darkerDarkColor,
        )),
        const SizedBox(width: 20.0),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(width: 20.0),
        const Expanded(
          child: Divider(
            thickness: 1.2,
            color: CustomColors.darkerDarkColor,
          ),
        ),
      ],
    );
  }
}
