import 'movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<Movie> newMovies = [ob, ob, ob, ob];
List<Movie> popMovies = [ob, ob, ob, ob];

final Movie ob = Movie(
  name: 'The Shining',
  box:
      'https://media.posterlounge.com/img/products/710000/705435/705435_poster.jpg',
  cover:
      'https://imgix.bustle.com/rehost/2016/9/13/3330d569-4faf-4354-b89c-f13273ce0ea6.jpg?w=1200&h=630&fit=crop&crop=faces&fm=jpg',
  description:
      'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future!',
  platforms: [
    'Apple Plus',
    'Paramount Plus',
  ],
  rating: 4,
  screenshots: [
    'https:\/\/external-content.duckduckgo.com\/iu\/?u=https%3A%2F%2Fimages5.alphacoders.com%2F401%2Fthumb-1920-401602.jpg&f=1&nofb=1&ipt=a06abccdbff48af697ead80e30f77a9cad4309bbdba6b5a2ffcb475dc35854b9&ipo=images',
    'https:\/\/external-content.duckduckgo.com\/iu\/?u=http%3A%2F%2Fwww.bizpacreview.com%2Fwp-content%2Fuploads%2F2017%2F05%2FThe-Shining-screenshot.png&f=1&nofb=1&ipt=8169b56e6111774c77b69ec964f3274345f8ddb1bfe69db75d90c32bedfcb5bb&ipo=images',
    'https:\/\/external-content.duckduckgo.com\/iu\/?u=http%3A%2F%2F4.bp.blogspot.com%2F-aAxWQbKaLK8%2FUqolYbSeoAI%2FAAAAAAAADVo%2F6yjdw04O2cI%2Fs1600%2Fshining_still10.jpg&f=1&nofb=1&ipt=5c3cd5b35be57087b9ea6a2a3b241af3aba5daa9770308b30e001902b81d6987&ipo=images',
    'https:\/\/external-content.duckduckgo.com\/iu\/?u=http%3A%2F%2F1.bp.blogspot.com%2F-X5wnMtX79q4%2FUOXnQa8GDXI%2FAAAAAAAAAi8%2Ff8gGS2sPYEs%2Fs1600%2FThe%2BShining%2B2.jpg&f=1&nofb=1&ipt=be3e1dde96dd469f1bbf3b459e33c990fa5e594578af79e6befa84be4622a319&ipo=images',
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
          name: jsonMovie['name'],
          box: jsonMovie['box'],
          cover: jsonMovie['cover'],
          description: jsonMovie['description'],
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

// void fetchPopMovie(Function(bool success) update) async {
//   try {
//     final url = Uri.https(_baseURL, 'popMovies.php');
//     final response = await http
//         .get(url)
//         .timeout(const Duration(seconds: 5)); // max timeout 5 seconds
//     if (response.statusCode == 200) {
//       // if successful call
//        final List <dynamic> jsonResponse = convert
//           .jsonDecode(response.body); // create dart json object from json array
//       for (var row in jsonResponse) {
//          final movie = Movie(name: jsonResponse['name'], box: jsonResponse[''] , cover: , platforms: , rating: , screenshots: )
//         // iterate over all rows in the json array
//         popMovies.add(
//             'cid: ${row['cid']} name: ${row['name']} balance: ${row['balance']}');
//       }
//       update(
//           true); // callback update method to inform that we completed retrieving data
//     }
//   } catch (e) {
//     update(false); // inform through callback that we failed to get data
//   }
// }

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
