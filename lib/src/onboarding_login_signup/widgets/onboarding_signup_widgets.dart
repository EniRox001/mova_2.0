import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:mova/utils/colors.dart';

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
  final Function() onPressed;

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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const SlideEffect(
                        activeDotColor: Color(
                          0xFFE21221,
                        ),
                        dotHeight: 14.0,
                        dotWidth: 14.0,
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

  final Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE21221),
          shape: const StadiumBorder()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

class WLogButton extends StatelessWidget {
  const WLogButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String icon;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          side: const BorderSide(
            color: Colors.black26,
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
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
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
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: textOne,
              style: const TextStyle(
                color: Colors.black38,
              )),
          TextSpan(
            text: textTwo,
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Expanded(child: Divider(thickness: 1.2)),
        SizedBox(width: 20.0),
        Text(
          "or",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20.0),
        Expanded(child: Divider(thickness: 1.2)),
      ],
    );
  }
}
