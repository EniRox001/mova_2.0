import 'package:flutter/material.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/spacings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:mova/utils/images.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

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
              padding: Pad.padMid,
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
    this.color = CustomColors.mainRedColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color, shape: const StadiumBorder()),
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

class WLogButtonSmall extends StatelessWidget {
  const WLogButtonSmall({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.fadedDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        side: const BorderSide(color: CustomColors.fadedLightColor, width: 1.0),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          icon,
          scale: 1.5,
        ),
      ),
    );
  }
}

class WRememberMe extends StatelessWidget {
  const WRememberMe({
    Key? key,
    required this.isChecked,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final String text;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          checkColor: CustomColors.mainLightColor,
          activeColor: CustomColors.mainRedColor,
          side: const BorderSide(
            color: CustomColors.mainRedColor,
            width: 2.5,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}

class WStockInputField extends StatelessWidget {
  const WStockInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.suffixIcon = Icons.nat});

  final TextEditingController controller;
  final String hintText;
  final IconData suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: CustomColors.darkerLightColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: CustomColors.fadedDarkColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: CustomColors.mainRedColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        suffixIcon: suffixIcon == Icons.nat
            ? const SizedBox()
            : Icon(
                suffixIcon,
                color: CustomColors.darkerLightColor,
              ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColors.darkerLightColor,
        ),
      ),
    );
  }
}

class WInputField extends StatelessWidget {
  const WInputField({
    Key? key,
    required this.controller,
    required this.prefix,
    required this.hintText,
    this.suffixIcon = Icons.nat,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData prefix;
  final String hintText;
  final IconData suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: CustomColors.darkerLightColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: CustomColors.fadedDarkColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: CustomColors.mainRedColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        prefixIcon: Icon(
          prefix,
          color: CustomColors.darkerLightColor,
        ),
        suffixIcon: suffixIcon == Icons.nat
            ? const SizedBox()
            : Icon(
                suffixIcon,
                color: CustomColors.darkerLightColor,
              ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColors.darkerLightColor,
        ),
      ),
    );
  }
}

class WForgotPassword extends StatelessWidget {
  const WForgotPassword({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: CustomColors.mainRedColor,
            ),
      ),
    );
  }
}

class WMovaLogo extends StatelessWidget {
  const WMovaLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        LogoImages.mainImage,
        scale: 0.6,
      ),
    );
  }
}

class WImageWIdget extends StatelessWidget {
  const WImageWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const CircleAvatar(
        backgroundColor: CustomColors.fadedDarkColor,
        radius: 50.0,
        child: Icon(
          Icons.person,
          color: CustomColors.mainDarkColor,
          size: 50,
        ),
      ),
    );
  }
}

class WDropdownWidget extends StatelessWidget {
  const WDropdownWidget({
    Key? key,
    required this.dropdownValue,
    required this.genders,
    required this.onPressed,
  }) : super(key: key);

  final String dropdownValue;
  final List<String> genders;
  final void Function(String?)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          color: CustomColors.fadedDarkColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton(
            borderRadius: BorderRadius.circular(20.0),
            underline: const SizedBox(),
            isExpanded: true,
            dropdownColor: Colors.black,
            value: dropdownValue,
            icon: const Icon(Icons.expand_more),
            items: genders.map((String genders) {
              return DropdownMenuItem(
                value: genders,
                child: Text(genders),
              );
            }).toList(),
            onChanged: onPressed),
      ),
    );
  }
}

class WPhoneNumberField extends StatelessWidget {
  const WPhoneNumberField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      flagsButtonMargin: const EdgeInsets.only(left: 24.0),
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon:
          const Icon(Icons.expand_more, color: CustomColors.darkerLightColor),
      dropdownTextStyle: const TextStyle(color: CustomColors.darkerLightColor),
      pickerDialogStyle:
          PickerDialogStyle(backgroundColor: CustomColors.fadedDarkColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: CustomColors.fadedDarkColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: CustomColors.mainRedColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColors.darkerLightColor,
        ),
      ),
      initialCountryCode: 'NG',
      onChanged: (phone) {},
    );
  }
}
