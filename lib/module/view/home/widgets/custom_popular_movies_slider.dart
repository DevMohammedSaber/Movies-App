import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/module/view/home/widgets/custom_item_details.dart';
import 'package:movies_app/common/shimmers/shimmer_effect.dart';
import 'package:movies_app/module/view/details/details_screen.dart';
import 'package:movies_app/module/controller/home_controler.dart';
import 'package:movies_app/utils/constants/colors.dart';
import 'package:movies_app/utils/constants/constants.dart';

class CustomPopularMoviesSlider extends StatelessWidget {
  const CustomPopularMoviesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeControllerImpl.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: controller.fetchMovies(Constants.popularUrl),
          builder: (_, snapshot) {
            List<MovieModel> moviesList = [];
            if (snapshot.hasData) {
              moviesList = snapshot.data!;
            }
            return SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: 10,
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  height: 240.h,
                  autoPlay: true,
                  viewportFraction: .5,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  onPageChanged: controller.updatePageIndicator,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
                itemBuilder: (context, index, pageViewIndex) {
                  return moviesList.isEmpty
                      ? const ZShimmerEffict(width: 500, height: 400)
                      : InkWell(
                          onTap: () {
                            Get.to(() => const DetailsScreen(), arguments: {
                              'id': moviesList[index].id.toString(),
                            });
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            width: 600.w,
                            height: 400.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                  Constants.imagepath +
                                      moviesList[index].posterPath!,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: CustomItemDetails(model: moviesList[index]),
                          ),
                        );
                },
              ),
            );
          },
        ),
        SizedBox(height: 15.h),
        Obx(
          () => Center(
            child: DotsIndicator(
              dotsCount: 10,
              position: controller.currentIndex.value,
              decorator: DotsDecorator(
                color: ZColors.grey,
                activeColor: ZColors.primary,
                size: Size.square(12.r),
                activeSize: Size(20.w, 10.h),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
