import 'package:flutter/material.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/strings.dart';

Future<dynamic> mShowCongratulations(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: CustomColors.mainDarkColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/congratulations_icon.png',
                scale: .75,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                SignUpCompletedPopupStrings.titleString,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: CustomColors.mainRedColor,
                    ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                SignUpCompletedPopupStrings.textString,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const CircularProgressIndicator(
                color: CustomColors.mainRedColor,
              )
            ],
          ),
        );
      });
}
