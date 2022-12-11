import 'package:flutter/material.dart';
import 'package:tmdb_flutter_edition/components/popular_movies.dart';
import 'package:tmdb_flutter_edition/components/tmdb_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmdbAppBar(true),
      body: Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: PopularMovies(),
          )),
    );
  }
}
