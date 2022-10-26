import 'package:flutter/cupertino.dart';

List onboardingImages = <String>[
  'assets/images/onboarding_image_one.jpg',
  'assets/images/onboarding_image_two.jpg',
  'assets/images/onboarding_image_three.jpg'
];

class Strings {
  String titleOne = 'Welcome to Mova';
  String titleTwo = 'Stream anytime, anywhere';
  String titleThree = 'Download to your device';
  String textOne =
      'The best streaming app of the century to make your days great';
  String textTwo =
      'With our curated library, watch your favorite movies and series anytime you want';
  String textThree =
      'Download your favorite movies directly to your mobile devices, to continue watching without data';
  String buttonTextOne = 'Next';
  String buttonTextTwo = 'Next';
  String buttonTextThree = 'Get Started';
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
