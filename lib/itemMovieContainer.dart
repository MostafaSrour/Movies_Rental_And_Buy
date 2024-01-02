import 'package:flutter/material.dart';
import 'movie.dart'; //movie
import "movieDetailsPage.dart"; //moviedetailspage
import "card.dart"; //card

class MovieContainer extends StatelessWidget {
  MovieContainer(this.buildContext, this.movie);
  final BuildContext buildContext;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () => _goGameDetailsPage(context, movie),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: movie.name,
              child: MovieCard(context, movie, width: 120),
            ),
            Padding(padding: const EdgeInsets.only(top: 6)),
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    Text(movie.getPlatforms(),
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.fade),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _goGameDetailsPage(BuildContext context, Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) {
          return MovieDetailsPage(movie);
        },
      ),
    );
  }
}
