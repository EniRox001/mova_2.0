import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/widgets.dart';
import 'package:mova/src/account_setup/view_model/fill_profile_viewmodel.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Fill Your Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
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
              ),
              const WStockInputField(hintText: 'Full Name'),
              const WStockInputField(hintText: 'Nickname'),
              const WStockInputField(
                  hintText: 'Email', suffixIcon: Icons.email),
              const WPhoneNumberField(),
              WDropdownWidget(
                dropdownValue: dropdownValue,
                genders: genders,
                onPressed: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: WLargeButton(
                      onPressed: () {},
                      buttonText: 'Skip',
                      color: CustomColors.darkerLightColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: WLargeButton(
                      onPressed: () {
                        showDialog(
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
                                      'Congratulations',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: CustomColors.mainRedColor,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Text(
                                      'Your account is ready to use. You will be redirected to the Home page in a few seconds',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
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
                      },
                      buttonText: 'Continue',
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
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
        hintText: 'Phone Number',
        hintStyle: const TextStyle(
          color: CustomColors.darkerLightColor,
        ),
      ),
      initialCountryCode: 'NG',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
