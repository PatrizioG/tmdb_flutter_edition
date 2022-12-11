import 'package:flutter/material.dart';
import 'package:tmdb_flutter_edition/components/movie_card.dart';
import 'package:tmdb_flutter_edition/model/movie.dart';
import 'package:tmdb_flutter_edition/pages/movie_page.dart';
import 'package:tmdb_flutter_edition/services/movies_service.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return FutureBuilder<List<Movie>>(
        future: MoviesService.fetchPopulars(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Scrollbar(
              controller: scrollController,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () => {
                                //Navigator.pushNamed(context, '/movie')
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MoviePage(movie: snapshot.data![i]),
                                  ),
                                )
                              },
                          child: MovieCard(movie: snapshot.data![i])),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            );
          } else {
            return const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
