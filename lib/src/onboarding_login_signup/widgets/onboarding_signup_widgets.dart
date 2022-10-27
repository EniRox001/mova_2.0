import 'package:flutter/material.dart';
import 'package:mova/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.onPressed,
    required this.buttonText,
    required this.controller,
  }) : super(key: key);

  final PageController controller;
  final String image;
  final String title;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x00000000),
                Color(0xCC000000),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const SlideEffect(
                        activeDotColor: CustomColors.mainRedColor,
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  WLargeButton(
                    onPressed: onPressed,
                    buttonText: buttonText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WLargeButton extends StatelessWidget {
  const WLargeButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.mainRedColor,
          shape: const StadiumBorder()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
