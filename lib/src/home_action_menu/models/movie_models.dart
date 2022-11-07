class Movie {
  final int id;
  final String name;
  final String imageLink;
  final List tags;
  final double ratings;
  final String playLink;

  const Movie({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.tags,
    required this.ratings,
    required this.playLink,
  });

  static Movie fromJson(json) => Movie(
      id: json['id'],
      name: json['name'],
      imageLink: json['imageLink'],
      tags: json['tags'],
      ratings: json['ratings'],
      playLink: json['playLink']);
}
