import 'package:flutter/material.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/spacings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://www.gamespot.com/a/uploads/original/1597/15976769/3964026-sv_specialod_72x48_strange_v2_lg.jpg',
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        LogoImages.mainImage,
                        scale: 1.5,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: CustomColors.mainLightColor,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: CustomColors.mainLightColor,
                              size: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: Pad.padMid,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Strange 2',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'Actions, Superhero, Science Fiction',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          WChipButton(
                            onPressed: () {},
                            backgroundColor: CustomColors.mainRedColor,
                            icon: Icons.play_arrow_rounded,
                            text: 'Play',
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          WChipButton(
                            onPressed: () {},
                            backgroundColor: Colors.transparent,
                            icon: Icons.add,
                            text: 'My List',
                            borders: const BorderSide(
                                color: CustomColors.mainLightColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: Pad.padMid,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top 10 Movies This Week',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: CustomColors.mainRedColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150.0,
                  child: ListView(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WChipButton extends StatelessWidget {
  const WChipButton({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.icon,
    required this.text,
    this.borders = BorderSide.none,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData icon;
  final String text;
  final BorderSide borders;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: StadiumBorder(side: borders),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
