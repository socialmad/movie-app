import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/upcoming_movie/upcoming_movie_controller.dart';
import 'package:movie_app/routes/app_routes.dart';
import 'package:movie_app/themes/app_text_theme.dart';
import 'package:movie_app/themes/colors_theme.dart';
import 'package:movie_app/utils/constants.dart';

class UpcomingMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpcomingMovieController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.white,
          title: const Text('Watch',
              style: TextStyle(
                  color: ThemeColor.primaryBlack, fontFamily: 'Poppins')),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: ThemeColor.primaryBlack))
          ],
        ),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.upcomingMovies.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.movieDetails,arguments: [controller.upcomingMovies[index].id]);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$imageBaseUrl${controller.upcomingMovies[index].backdropPath}',
                              fit: BoxFit.cover,
                              height: Get.height * 0.30,
                              width: Get.width,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0)),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent
                                      ])),
                            ),
                          ),
                          Positioned(
                              bottom: 12,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  controller
                                      .upcomingMovies[index].originalTitle,
                                  style: poppinsRegular(
                                      fontSize: 20,
                                      color: ThemeColor.white,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                ),
              ),
      ),
    );
  }
}
