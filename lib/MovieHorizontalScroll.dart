import 'package:flutter/material.dart';
import 'card.dart'; //card
import 'movie.dart';

class MovieHorizontalScroll extends StatelessWidget {
  MovieHorizontalScroll(this.movieItems);
  final List<Movie> movieItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(240),
      child: ListView.builder(
          itemCount: movieItems.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 12, top: 4),
          itemBuilder: (BuildContext context, int position) {
            return MovieCard(context, movieItems[position]);
          }),
    );
  }
}
