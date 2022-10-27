import 'package:flutter/material.dart';
import 'package:mova/src/onboarding_login_signup/screens/signin_main.dart';
import 'package:mova/src/onboarding_login_signup/widgets/onboarding_signup_widgets.dart';
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
            image: onboardingImages[0],
            title: OnboardingStrings.titleOne,
            text: OnboardingStrings.textOne,
            onPressed: () => toNextPage(controller),
            buttonText: OnboardingStrings.buttonTextOne,
          ),
          OnboardingWidget(
            controller: controller,
            image: onboardingImages[1],
            title: OnboardingStrings.titleTwo,
            text: OnboardingStrings.textTwo,
            onPressed: () {
              toNextPage(controller);
            },
            buttonText: OnboardingStrings.buttonTextTwo,
          ),
          OnboardingWidget(
            controller: controller,
            image: onboardingImages[2],
            title: OnboardingStrings.titleThree,
            text: OnboardingStrings.textThree,
            onPressed: () {
              navigateToPage(context, const SignupMain());
            },
            buttonText: OnboardingStrings.buttonTextThree,
          ),
        ],
      ),
    );
  }
}
