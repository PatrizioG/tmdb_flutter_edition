import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_flutter_edition/Component/movie_card.dart';
import 'package:tmdb_flutter_edition/model/movie.dart';
import 'package:tmdb_flutter_edition/services/movies_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF0D253F, {
          50: Color(0x000d253f),
          100: Color(0x000D253F),
          200: Color(0x000D253F),
          300: Color(0x000D253F),
          400: Color(0x000D253F),
          500: Color(0x000D253F),
          600: Color(0x000D253F),
          700: Color(0x000D253F),
          800: Color(0x000D253F),
          900: Color(0x000D253F),
        }),
      ),
      home: const MyHomePage(title: 'flutter edition'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: SvgPicture.asset('tmdb_logo.svg', semanticsLabel: 'tmdb logo'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('tmdb_logo.png'),
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.caveat(fontSize: 32.0),
        ),
      ),
      body: FutureBuilder<List<Movie>>(
          future: MoviesService.fetchPopulars(),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Scrollbar(
                controller: _scrollController,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return MovieCard(movie: snapshot.data![i]);
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
          }),
    );
  }
}
