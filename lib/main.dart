import 'package:flutter/material.dart';
import 'package:tmdb_flutter_edition/pages/home_page.dart';

void main() {
  //debugPaintSizeEnabled = true;
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
      home: const HomePage(),
    );
  }
}
