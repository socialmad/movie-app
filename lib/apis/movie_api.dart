import 'package:dio/dio.dart';
import 'package:movie_app/utils/constants.dart';

class MovieApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future<dynamic> getUpcomingMovies() async {
    final response = await dio.get('/movie/upcoming?api_key=$apiKey');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getMovieDetails({required int movieId}) async {
    final response = await dio.get('/movie/$movieId?api_key=$apiKey');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
