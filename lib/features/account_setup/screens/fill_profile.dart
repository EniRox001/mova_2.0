import 'package:flutter/material.dart';
import 'package:mova/features/home_action_menu/screens/home_screen.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/strings.dart';
import 'package:mova/utils/widgets.dart';
import 'package:mova/features/account_setup/view_model/fill_profile_viewmodel.dart';
import 'package:mova/utils/methods.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(FillProfileStrings.titleString),
      ),
      body: Padding(
        padding: Pad.padMid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const WImageWIdget(),
            WStockInputField(
                controller: fullNameController,
                hintText: FillProfileStrings.fullNameHintString),
            WStockInputField(
                controller: nickNameController,
                hintText: FillProfileStrings.nickNameHintString),
            WStockInputField(
                controller: emailController,
                hintText: FillProfileStrings.emailHintString,
                suffixIcon: Icons.email),
            WPhoneNumberField(
              controller: phoneNumberController,
              hintText: FillProfileStrings.phoneNumberHintString,
            ),
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
                    onPressed: () {
                      mShowCongratulations(context);
                      Future.delayed(
                        const Duration(seconds: 3),
                        () => navigateToPage(
                          context,
                          const HomeScreen(),
                        ),
                      );
                    },
                    buttonText: FillProfileStrings.skipButtonString,
                    color: CustomColors.darkerLightColor,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: WLargeButton(
                    onPressed: () {
                      mShowCongratulations(context);
                      Future.delayed(
                        const Duration(seconds: 3),
                        () => navigateToPage(
                          context,
                          const HomeScreen(),
                        ),
                      );
                    },
                    buttonText: FillProfileStrings.continueButtonString,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
