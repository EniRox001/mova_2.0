import 'package:flutter/cupertino.dart';

List onboardingImages = <String>[
  'assets/images/onboarding_image_one.jpg',
  'assets/images/onboarding_image_two.jpg',
  'assets/images/onboarding_image_three.jpg'
];

class OnboardingStrings {
  OnboardingStrings._();
  static const String titleOne = 'Welcome to Mova';
  static const String titleTwo = 'Stream anytime, anywhere';
  static const String titleThree = 'Download to your device';
  static const String textOne =
      'The best streaming app of the century to make your days great';
  static const String textTwo =
      'With our curated library, watch your favorite movies and series anytime you want';
  static const String textThree =
      'Download your favorite movies directly to your mobile devices, to continue watching without data';
  static const String buttonTextOne = 'Next';
  static const String buttonTextTwo = 'Next';
  static const String buttonTextThree = 'Get Started';
}

toLastPage(PageController controller) {
  controller.jumpToPage(2);
}

toNextPage(PageController controller) {
  controller.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
