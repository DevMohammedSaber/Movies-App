import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies_app/utils/constants/constants.dart';
import 'package:movies_app/module/controller/home_controler.dart';
import 'package:movies_app/module/view/home/widgets/custom_popular_movies_slider.dart';
import 'package:movies_app/module/view/home/widgets/cutom_title_category.dart';
import 'package:movies_app/module/view/home/widgets/custom_list_view_builder.dart';
import 'package:movies_app/module/view/sub_category/sub_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeControllerImpl());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50.h,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          height: 40.h,
          width: 165.w,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            CustomTitleOfCategory(
              title: 'Popular Movies',
              onPressed: () {
                Get.to(() => const SubCategoryScreen(
                      title: 'Popular Movies',
                      urlLink: Constants.popularUrl,
                    ));
              },
            ),
            SizedBox(height: 20.h),
            const CustomPopularMoviesSlider(),
            SizedBox(height: 30.h),
            CustomTitleOfCategory(
              title: 'Top Rated Movies',
              onPressed: () {
                Get.to(() => const SubCategoryScreen(
                      title: 'Top Rated Movies',
                      urlLink: Constants.topRatedUrl,
                    ));
              },
            ),
            FutureBuilder(
                future: controller.fetchMovies(Constants.topRatedUrl),
                builder: (_, snapshot) {
                  return CustomListViewBuilder(
                    snapshot: snapshot,
                  );
                }),
            CustomTitleOfCategory(
              title: 'Up Coming Movies',
              onPressed: () {
                Get.to(() => const SubCategoryScreen(
                      title: 'Up Coming Movies',
                      urlLink: Constants.upComingUrl,
                    ));
              },
            ),
            FutureBuilder(
                future: controller.fetchMovies(Constants.upComingUrl),
                builder: (_, snapshot) {
                  return CustomListViewBuilder(
                    snapshot: snapshot,
                  );
                }),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
