import 'package:get/get.dart';
import 'package:movie_app/apis/movie_api.dart';
import 'package:movie_app/models/upcoming_movie_model.dart';

class UpcomingMovieController extends GetxController {

  MovieApi movieApi = MovieApi();
  List<UpcomingMovieModel> upcomingMovies = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchUpcomingMovies();
  }

  void fetchUpcomingMovies() async {
    var response = await movieApi.getUpcomingMovies();
    if(response != null){
      response['results'].forEach((data) {
        upcomingMovies.add(UpcomingMovieModel.fromMap(data));
      });
      isLoading = false;
      update();
    }
  }


}