import 'package:flutter/material.dart';
import 'package:mova/src/onboarding_login_signup/screens/signin_main.dart';
import 'package:mova/utils/widgets.dart';
import 'package:mova/src/onboarding_login_signup/view_model/onboarding_viewmodel.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/strings.dart';
import 'package:mova/utils/images.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          OnboardingWidget(
            controller: controller,
            image: OnboardingImages.imageOne,
            title: OnboardingStrings.titleOneString,
            text: OnboardingStrings.textOneString,
            onPressed: () => toNextPage(controller),
            buttonText: OnboardingStrings.buttonOneString,
          ),
          OnboardingWidget(
            controller: controller,
            image: OnboardingImages.imageTwo,
            title: OnboardingStrings.titleTwoString,
            text: OnboardingStrings.textTwoString,
            onPressed: () {
              toNextPage(controller);
            },
            buttonText: OnboardingStrings.buttonTwoString,
          ),
          OnboardingWidget(
            controller: controller,
            image: OnboardingImages.imageThree,
            title: OnboardingStrings.titleThreeString,
            text: OnboardingStrings.textThreeString,
            onPressed: () {
              navigateToPage(context, const SignupMain());
            },
            buttonText: OnboardingStrings.buttonThreeString,
          ),
        ],
      ),
    );
  }
}
