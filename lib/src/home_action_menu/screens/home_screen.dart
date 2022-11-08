import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/src/home_action_menu/models/movie_models.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> moviesFuture;

  @override
  void initState() {
    super.initState();
    moviesFuture = getMovies(context);
  }

  static Future<List<Movie>> getMovies(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/json/movies.json');
    final movieData = json.decode(data);
    return movieData.map<Movie>(Movie.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              FancyShimmerImage(
                imageUrl:
                    'https://www.gamespot.com/a/uploads/original/1597/15976769/3964026-sv_specialod_72x48_strange_v2_lg.jpg',
                shimmerBaseColor: CustomColors.fadedDarkColor,
                shimmerHighlightColor: CustomColors.fadedRedColor,
                shimmerBackColor: CustomColors.mainRedColor,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.cover,
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
              shrinkWrap: true,
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
                  height: 180.0,
                  child: FutureBuilder<List<Movie>>(
                      future: moviesFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final movies = snapshot.data!;
                          return buildMovies(movies);
                        } else {
                          return const Text('no movie data');
                        }
                      }),
                ),
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

Widget buildMovies(List<Movie> movies) => ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FancyShimmerImage(
              width: 130.0,
              imageUrl: movie.imageLink,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: CustomColors.mainRedColor),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  movie.ratings.toString(),
                ),
              ),
            ),
          )
        ]);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10.0,
      ),
      itemCount: movies.length,
    );
