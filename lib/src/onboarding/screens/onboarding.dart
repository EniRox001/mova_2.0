import 'package:flutter/material.dart';
import 'package:mova/src/onboarding/widgets/onboarding_widgets.dart';
import 'package:mova/src/onboarding/view_model/onboarding_viewmodel.dart';

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
            title: Strings().titleOne,
            text: Strings().textOne,
            onPressed: () => toNextPage(controller),
            buttonText: Strings().buttonTextOne,
          ),
          OnboardingWidget(
            controller: controller,
            image: onboardingImages[1],
            title: Strings().titleTwo,
            text: Strings().textTwo,
            onPressed: () {
              toNextPage(controller);
            },
            buttonText: Strings().buttonTextTwo,
          ),
          OnboardingWidget(
            controller: controller,
            image: onboardingImages[2],
            title: Strings().titleThree,
            text: Strings().textThree,
            onPressed: () {
              print('go to login page');
            },
            buttonText: Strings().buttonTextThree,
          ),
        ],
      ),
    );
  }
}