import 'package:get/get.dart';
import 'package:movie_app/apis/movie_api.dart';
import 'package:movie_app/models/movie_details_model.dart';

class MovieDetailsController extends GetxController {
  int movieId = Get.arguments[0];
  MovieApi movieApi = MovieApi();
  
  bool isLoading = true;
  List<MovieDetailsModel> movieData = [];

  @override
  void onInit() {
    super.onInit();
    fetchMovieDetails();
  }

  void fetchMovieDetails() async {
    var response = await movieApi.getMovieDetails(movieId: movieId);
    if(response != null){
      movieData.add(MovieDetailsModel.fromMap(response));
      isLoading = false;
      update();
    }
  }


}