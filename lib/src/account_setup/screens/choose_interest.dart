import 'package:flutter/material.dart';
import 'package:mova/utils/colors.dart';

class ChooseInterest extends StatefulWidget {
  const ChooseInterest({super.key});

  @override
  State<ChooseInterest> createState() => _ChooseInterestState();
}

class _ChooseInterestState extends State<ChooseInterest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Your Interest',
        ),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 10.0,
            runSpacing: 20.0,
            children: const [WInterestCard(text: 'Action')],
          )
        ],
      ),
    );
  }
}

class WInterestCard extends StatelessWidget {
  const WInterestCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(
        text.toLowerCase(),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
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
                  color: CustomColors.mainRedColor,
                ),
          ),
        ),
      ),
    );
  }
}
