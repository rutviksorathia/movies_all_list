import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/modelMovieList.dart';

Future<Movie> apiMovieList() async {
  final url = Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?api_key=55903b004b65252bf433fb4218601d2c&language=en-US&sort_by=popularity.desc&page=1');

  var response = await http.get(url);

  final body = json.decode(response.body);

  return Movie.fromMap(body);
}
