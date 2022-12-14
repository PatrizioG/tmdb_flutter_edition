class Movie {
  final int id;
  final String title;
  final String overview;
  final double popularity;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      popularity: json['popularity'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
    );
  }
}
