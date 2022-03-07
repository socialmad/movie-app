import 'package:get/get.dart';
import 'package:movie_app/modules/movie_details/movie_details_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailsController());
  }
}