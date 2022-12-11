import 'package:flutter/material.dart';
import 'package:tmdb_flutter_edition/components/movie_background.dart';
import 'package:tmdb_flutter_edition/components/movie_card.dart';
import 'package:tmdb_flutter_edition/components/tmdb_app_bar.dart';
import 'package:tmdb_flutter_edition/model/movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmdbAppBar(),
      body: Column(
        children: [
          Stack(children: [
            MovieBackground(
              "https://image.tmdb.org/t/p/w1280${movie.backdropPath}",
              height: 500,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w154${movie.posterPath}",
                        width: 154,
                      )),
                ),
                Text(
                  movie.title,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ])
        ],
      ),
    );
  }
}
