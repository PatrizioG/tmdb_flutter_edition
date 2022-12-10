import 'package:flutter/material.dart';
import 'package:tmdb_flutter_edition/model/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // https://stackoverflow.com/questions/51513429/how-to-do-rounded-corners-image-in-flutter
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "https://image.tmdb.org/t/p/w154${movie.posterPath}",
                width: 154,
              )),
          Text(movie.title),
        ],
      ),
    );
  }
}
