import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mova/utils/colors.dart';
import 'package:mova/utils/images.dart';
import 'package:mova/utils/spacings.dart';
import 'package:mova/models/movie_models.dart';
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
          const WFeaturedMovieWidget(),
          Expanded(
            child: ListView(
              shrinkWrap: false,
              padding: Pad.padMid,
              children: [
                WMovieCategory(
                    movieCategoryName: 'Top 10 Movies This Week',
                    moviesFuture: moviesFuture),
                WMovieCategory(
                    movieCategoryName: 'New Releases',
                    moviesFuture: moviesFuture),
                WMovieCategory(
                    movieCategoryName: 'Based on your Interests',
                    moviesFuture: moviesFuture),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WMovieCategory extends StatelessWidget {
  const WMovieCategory({
    Key? key,
    required this.movieCategoryName,
    required this.moviesFuture,
  }) : super(key: key);

  final String movieCategoryName;
  final Future<List<Movie>> moviesFuture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movieCategoryName,
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
    );
  }
}

class WFeaturedMovieWidget extends StatelessWidget {
  const WFeaturedMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FancyShimmerImage(
          imageUrl:
              'https://fzmovies.net/imdb_images/Thor.Love.and.Thunder.2022.jpg',
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
                  'Thor Love and Thunder',
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
                      borders:
                          const BorderSide(color: CustomColors.mainLightColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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
      shrinkWrap: false,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Stack(children: [
          GestureDetector(
            onTap: () {
              print(movie.name);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FancyShimmerImage(
                width: 130.0,
                imageUrl: movie.imageLink,
                shimmerBaseColor: CustomColors.fadedDarkColor,
                shimmerHighlightColor: CustomColors.fadedRedColor,
                shimmerBackColor: CustomColors.mainRedColor,
              ),
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
