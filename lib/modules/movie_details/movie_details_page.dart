import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/movie_details/movie_details_controller.dart';
import 'package:movie_app/themes/app_text_theme.dart';
import 'package:movie_app/themes/colors_theme.dart';
import 'package:movie_app/utils/constants.dart';

class MovieDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailsController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
                headerSliverBuilder:
                    ((BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      title: Text(
                        controller.movieData[0].originalTitle,
                        style: poppinsRegular(
                            fontSize: 20,
                            color: ThemeColor.white,
                            fontWeight: FontWeight.bold),
                      ),
                      expandedHeight: Get.height / 1.8,
                      floating: true,
                      pinned: true,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  '$imageBaseUrl${controller.movieData[0].backdropPath}',
                              fit: BoxFit.cover,
                              width: Get.width,
                              height: Get.height,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent
                                    ])),
                              ),
                            ),
                          ],
                        ),
                        collapseMode: CollapseMode.parallax,
                      ),
                    )
                  ];
                }),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Overview',
                          style: poppinsRegular(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text(controller.movieData[0].overview,
                          style: poppinsRegular(color: ThemeColor.primaryGrey),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
