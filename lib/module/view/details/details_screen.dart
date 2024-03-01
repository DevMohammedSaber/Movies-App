import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:movies_app/module/controller/details_controller.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/module/view/details/widgets/custom_back_button.dart';
import 'package:movies_app/module/view/details/widgets/custom_container_details.dart';
import 'package:movies_app/module/view/details/widgets/custom_poster_widget.dart';
import 'package:movies_app/utils/constants/colors.dart';
import 'package:movies_app/utils/helpers/helper_functions.dart';
import 'package:movies_app/common/shimmers/shimmer_effect.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final controller = Get.put(DetailsScreenControllerImpl());

    final id = Get.arguments['id'] as String;
    MovieModel? model;
    return Scaffold(
      body: FutureBuilder(
        future: controller.fetchMovieDetails(id),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            model = snapshot.data as MovieModel;
          } else if (snapshot.hasError) {
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Data not found!',
                    style: Theme.of(context).textTheme.headlineMedium),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ZColors.primary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                  ),
                  child: Text(
                    'Back to Home',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const CustomBackButton(),
                backgroundColor: dark ? ZColors.dark : ZColors.light,
                expandedHeight: 420.h,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        bottomRight: Radius.circular(24.r)),
                    child: !snapshot.hasData
                        ? const ZShimmerEffict(
                            width: double.infinity, height: 500)
                        : CustomPosterWidget(model: model),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Overview',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          IconButton(
                            onPressed: () {
                              Share.share('movie://app.com/${model!.id}');
                            },
                            icon: const Icon(Icons.share),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      !snapshot.hasData
                          ? const ZShimmerEffict(
                              width: double.infinity, height: 150)
                          : Text(
                              model!.overview!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            !snapshot.hasData
                                ? const ZShimmerEffict(width: 100, height: 50)
                                : CustomContainerDetailsScreen(
                                    title: 'Release Date: ',
                                    body: Text(
                                      model!.releaseDate!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                            !snapshot.hasData
                                ? const ZShimmerEffict(width: 100, height: 70)
                                : CustomContainerDetailsScreen(
                                    title: 'Rating: ',
                                    body: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          '${model!.voteAverage!.toStringAsFixed(1)}/10',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ZColors.primary,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.w, vertical: 10.h),
                        ),
                        child: Text(
                          'Watch',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
