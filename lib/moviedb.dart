import 'movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<Movie> newMovies = [];
List<Movie> popMovies = [];

Future<void> fetchData() async {
  await fetchMoviesFromPop('mostafasrour.000webhostapp.com');
  await fetchMoviesFromNew('mostafasrour.000webhostapp.com/newMovies.php');
}

Future<void> fetchMoviesFromPop(String url) async {
  await fetchMovies(url, popMovies);
}

Future<void> fetchMoviesFromNew(String url) async {
  await fetchMovies(url, newMovies);
}

Future<void> fetchMovies(String url, List<Movie> moviesList) async {
  final url = Uri.https('mostafasrour.000webhostapp.com', 'popMovies.php');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = convert.json.decode(response.body);

    for (var jsonMovie in jsonResponse) {
      final movie = Movie.fromJson(jsonMovie);

      // Assuming the fields are named as in the provided PHP response
      movie.platforms = (jsonMovie['platforms'] as String).split(' ');
      movie.screenshots = (jsonMovie['screenshots'] as String).split(' ');

      moviesList.add(movie);
    }
  } else {
    throw Exception('Failed to load data from $url');
  }
}
