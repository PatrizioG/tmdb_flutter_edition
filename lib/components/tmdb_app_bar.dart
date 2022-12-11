import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget? tmdbAppBar(bool showLogo) {
  Widget? leading = showLogo
      ? Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('tmdb_logo.png'),
        )
      : null;

  return AppBar(
    leading: leading,
    title: Text(
      'flutter edition',
      style: GoogleFonts.caveat(fontSize: 32.0),
    ),
  );
}
