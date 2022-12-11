import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget? tmdbAppBar() {
  return AppBar(
    //leading: leading,
    title: Row(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset('tmdb_logo.png'),
        ),
        Text(
          'flutter edition',
          style: GoogleFonts.caveat(fontSize: 32.0),
        ),
      ],
    ),
  );
}
