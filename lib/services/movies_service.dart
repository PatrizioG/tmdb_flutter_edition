import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_flutter_edition/model/movie.dart';
import 'package:tmdb_flutter_edition/secrets.dart' as secrets;

String base = "https://api.themoviedb.org/3/";

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

class MoviesService {
  static Future<List<Movie>> fetchPopulars() async {
    final response = await http.get(Uri.parse("${base}movie/popular"),
        headers: composeHeaders());

    if (response.statusCode == 200) {
      Map<String, dynamic> res =
          jsonDecode(response.body); // oggetto con "page" e "results"
      List<dynamic> res2 = res['results']; // lista di oggetti film

      List<Movie> movies = List<Movie>.empty(growable: true);
      for (Map<String, dynamic> res3 in res2) {
        movies.add(Movie.fromJson(res3));
      }
      return movies;
      //Movie.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies: ${response.reasonPhrase}');
    }
  }
}

Map<String, String> composeHeaders() {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${secrets.token}',
  };
}
