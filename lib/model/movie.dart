class Movie {
  final int id;
  final String title;
  final String overview;
  final double popularity;
  final String backdropPath;
  final String posterPath;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.backdropPath,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      popularity: json['popularity'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
    );
  }
}
