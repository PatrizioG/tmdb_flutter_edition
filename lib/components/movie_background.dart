import 'package:flutter/material.dart';

class MovieBackground extends StatelessWidget {
  final String urlImage;
  final double height;
  const MovieBackground(this.urlImage, {super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    // https://stackoverflow.com/questions/50449610/pick-main-color-from-picture
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: height,
        child: FittedBox(
          fit: BoxFit.cover,
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            urlImage,
            color: Colors.black.withOpacity(0.8),
            colorBlendMode: BlendMode.srcOver,
          ),
        ));
  }
}
