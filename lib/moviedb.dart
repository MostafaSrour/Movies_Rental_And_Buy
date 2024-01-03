import 'movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<Movie> newMovies = [ob, ob, ob, ob];
List<Movie> popMovies = [ob, ob, ob, ob];

final Movie ob = Movie(
  name: 'Plants vs. Zombies: Garden Warfare 2',
  box:
      'https://raw.githubusercontent.com/searchy2/FlutterGames/master/images/box/pvzgw2.jpg',
  cover:
      'https://raw.githubusercontent.com/searchy2/FlutterGames/master/images/cover/pvzgw2.jpg',
  description:
      'The battle for suburbia grows to crazy new heights! In this hilarious, action-packed shooter, zombie leader Dr. Zomboss has strengthened his horde and rebuilt suburbia as a zombie utopia. But hope remains, because for the first time the plants are taking the offensive in an all-out attack to reclaim their turf. Play as the plants in the all-new 24-player Herbal Assault mode, or choose your side in 4-player co-op or Solo Play!',
  platforms: [
    'XBOX ONE',
    'PS4',
  ],
  rating: 4,
  screenshots: [
    'https://raw.githubusercontent.com/searchy2/FlutterGames/master/images/screenshot/pvzgw2_1.jpg',
    'https://raw.githubusercontent.com/searchy2/FlutterGames/master/images/screenshot/pvzgw2_2.jpg',
    'https://raw.githubusercontent.com/searchy2/FlutterGames/master/images/screenshot/pvzgw2_3.jpg',
    'https://raw.githubusercontent.com/searchy2/FlutterGames/master/images/screenshot/pvzgw2_4.jpg',
  ],
);

String _baseURL = "mostafasrour.000webhost.com";

Future<void> fetchPopMovies(Function(bool success) update) async {
  try {
    final url = Uri.https(_baseURL, 'popMovies.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);

      for (var jsonMovie in jsonResponse) {
        final movie = Movie(
          name: jsonMovie['name'] ?? '',
          box: jsonMovie['box'] ?? '',
          cover: jsonMovie['cover'] ?? '',
          description: jsonMovie['description'] ?? '',
          platforms: (jsonMovie['platforms'] as List<dynamic>?)
                  ?.map((platform) => platform.toString())
                  .toList() ??
              [],
          rating: (jsonMovie['rating'] as num?)?.toDouble() ?? 0,
          screenshots: (jsonMovie['screenshots'] as List<dynamic>?)
                  ?.map((screenshot) => screenshot.toString())
                  .toList() ??
              [],
        );

        popMovies.add(movie);
      }

      update(true);
    } else {
      update(false);
    }
  } catch (e) {
    update(false);
  }
}

Future<void> fetchnewMovies(Function(bool success) update) async {
  try {
    final url = Uri.https(_baseURL, 'newMovies.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);

      for (var jsonMovie in jsonResponse) {
        final movie = Movie(
          name: jsonMovie['name'] ?? '',
          box: jsonMovie['box'] ?? '',
          cover: jsonMovie['cover'] ?? '',
          description: jsonMovie['description'] ?? '',
          platforms: (jsonMovie['platforms'] as List<dynamic>?)
                  ?.map((platform) => platform.toString())
                  .toList() ??
              [],
          rating: (jsonMovie['rating'] as num?)?.toDouble() ?? 0,
          screenshots: (jsonMovie['screenshots'] as List<dynamic>?)
                  ?.map((screenshot) => screenshot.toString())
                  .toList() ??
              [],
        );

        newMovies.add(movie);
      }

      update(true);
    } else {
      update(false);
    }
  } catch (e) {
    update(false);
  }
}
// This dart code for fetching data from a php page is not working
// The php page is on 000webhost, it just pulls data from the database and displays it in its raw format, the code for this page is working. Now when I try to fetch this data in flutter and populate a list with it, nothing happens, I've tried several ways already, but non worked. I also checked if the list is actually being displayed in my page by putting data manually, and its working fine.
//
// this is the code that I wrote:
