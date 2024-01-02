import 'package:flutter/material.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  static const IMAGE_RATIO = 1.50;

  MovieCard(this.buildContext, this.movie, {this.width = 120});
  final BuildContext buildContext;
  final Movie movie;
  final double width;

  @override
  Widget build(BuildContext context) {
    double height = IMAGE_RATIO * width;

    return Material(
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.hardEdge,
      elevation: 8,
      shadowColor: const Color(0xCC000000),
      child: FadeInImage.assetNetwork(
        image: movie.box,
        placeholder: "assets/placeholder_box.png",
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
