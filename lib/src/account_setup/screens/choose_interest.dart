import 'package:flutter/material.dart';
import 'package:mova/src/account_setup/screens/fill_profile.dart';
import 'package:mova/src/account_setup/view_model/choose_interest_viewmodel.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/utils/widgets.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/navigators.dart';
import 'package:mova/utils/strings.dart';

class ChooseInterest extends StatefulWidget {
  const ChooseInterest({super.key});

  @override
  State<ChooseInterest> createState() => _ChooseInterestState();
}

class _ChooseInterestState extends State<ChooseInterest> {
  List<String> tChosenInterests = [];

  void setSelectedButton(int index) {
    setState(() {
      selectedButton = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ChooseInterestStrings.titleString,
        ),
      ),
      body: Padding(
        padding: Pad.padMid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              ChooseInterestStrings.bodyTextString,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  Wrap(
                    runAlignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    runSpacing: 20.0,
                    children: [
                      for (var i = 0; i < interestCategories.length; i++)
                        WInterestCard(
                          onPressed: () {
                            setSelectedButton(i);
                            tChosenInterests.contains(interestCategories[i])
                                ? tChosenInterests.remove(interestCategories[i])
                                : tChosenInterests.add(interestCategories[i]);
                          },
                          text: interestCategories[i].capitalize(),
                          color: selectedButton == 99
                              ? Colors.transparent
                              : tChosenInterests.contains(interestCategories[i])
                                  ? CustomColors.mainRedColor
                                  : Colors.transparent,
                          textColor: selectedButton == 99
                              ? Colors.transparent
                              : tChosenInterests.contains(interestCategories[i])
                                  ? CustomColors.mainLightColor
                                  : CustomColors.mainRedColor,
                        )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: WLargeButton(
                    onPressed: () {
                      navigateToPage(context, const FillProfile());
                    },
                    buttonText: ChooseInterestStrings.skipButtonString,
                    color: CustomColors.darkerLightColor,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: WLargeButton(
                    onPressed: () {
                      navigateToPage(context, const FillProfile());
                    },
                    buttonText: ChooseInterestStrings.continueButtonString,
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

class WInterestCard extends StatelessWidget {
  const WInterestCard({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: CustomColors.mainRedColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            100.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 6.0,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: textColor,
                ),
          ),
        ),
      ),
    );
  }
}
