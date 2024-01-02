import 'package:flutter/material.dart';
import 'MovieHorizontalScroll.dart';
import 'moviedb.dart';

class MoviePage extends StatefulWidget {
  MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 8, 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Releases",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        "Browse All",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ]),
          ),
          MovieHorizontalScroll(newMovies),
          const Divider(height: 2, indent: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        "Browse All",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ]),
          ),
          MovieHorizontalScroll(popMovies),
        ],
      ),
    );
  }
}
