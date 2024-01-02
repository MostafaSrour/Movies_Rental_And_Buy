import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'movie.dart';
import 'card.dart';
import 'itemHeaderDiagonal.dart';
import 'itemRating.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: _buildDiagonalImageBackground(context),
        ),
        const Positioned(
          top: 26,
          left: 4,
          child: BackButton(color: Colors.white),
        ),
        Positioned(
          bottom: 0,
          left: 16,
          right: 16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Hero(
                  tag: movie.name,
                  child: MovieCard(
                    context,
                    movie,
                    width: 150,
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.name,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: RatingInformation(movie),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            OutlinedButton(
                              onPressed: () => {},
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    CupertinoIcons.play_circle,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displaySmall! // Update this according to the new text theme if needed
                                        .color,
                                  ),
                                  Text("Trailer",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall // Update this according to the new text theme if needed
                                      ),
                                ],
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.fromLTRB(6, 0, 12, 0)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                                side: MaterialStateProperty.all(BorderSide(
                                    color: Colors.black54, width: 2)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white70),
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Colors
                                          .black12; // Replace this color as needed for pressed state
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 8)),
                            OutlinedButton(
                              onPressed: () => {},
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    CupertinoIcons.plus,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displaySmall! // Update this according to the new text theme if needed
                                        .color,
                                  ),
                                  Text("Wishlist",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall // Update this according to the new text theme if needed
                                      ),
                                ],
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.fromLTRB(6, 0, 12, 0)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                                side: MaterialStateProperty.all(BorderSide(
                                    color: Colors.black54, width: 2)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white70),
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Colors
                                          .black12; // Replace this color as needed for pressed state
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDiagonalImageBackground(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return DiagonallyCutColoredImage(
      FadeInImage.assetNetwork(
        image: movie.cover,
        placeholder: "assets/placeholder_cover.jpg",
        width: screenWidth,
        height: 260,
        fit: BoxFit.cover,
      ),
      color: const Color(0x00FFFFFF),
    );
  }
}
