import 'package:flutter/material.dart';
import 'itemDescription.dart';
import 'itemHeader.dart';
import 'screenshotHorizontalScroll.dart';
import 'movie.dart';

class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage(this.movie, {Key? key}) : super(key: key);

  final Movie movie;

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(widget.movie),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.adjust,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Rent",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium! // Ensure this is updated according to the new text themes if needed
                            .apply(color: Colors.white),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.green.shade400; // For splashColor
                        return null; // Defer to the widget's default.
                      },
                    ),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(
                        Colors.green.shade400), // For highlightElevation
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SizedBox(
                width: double.infinity,
                // height: double.infinity,
                child: OutlinedButton(
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.archive,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "Buy",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium! // Make sure this is updated according to the new text themes if needed
                            .apply(color: Colors.green),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.green, width: 4)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.green.shade200; // For splashColor
                        if (states.contains(MaterialState.hovered) ||
                            states.contains(MaterialState.focused))
                          return Colors.white70; // For highlightColor
                        return null; // Defer to the widget's default.
                      },
                    ),
                    elevation: MaterialStateProperty.all(0),
                    foregroundColor: MaterialStateProperty.all(
                        Colors.green.shade400), // For highlightedBorderColor
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: DescriptionText(widget.movie.description)),
            ScreenShotHorizontalScroll(widget.movie.screenshots),
          ],
        ),
      ),
    );
  }
}
