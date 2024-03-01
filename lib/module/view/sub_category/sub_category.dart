import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies_app/module/controller/sub_category_controller.dart';
import 'package:movies_app/module/view/details/details_screen.dart';
import 'package:movies_app/module/view/home/widgets/custom_item_details.dart';
import 'package:movies_app/utils/constants/constants.dart';
import 'package:movies_app/common/shimmers/shimmer_effect.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({
    super.key,
    required this.title,
    required this.urlLink,
  });
  final String title;
  final String urlLink;
  @override
  Widget build(BuildContext context) {
    SubCategoryControllerImpl contrller = SubCategoryControllerImpl();
    contrller.initUrlLink = urlLink;
    Get.put(contrller);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: GetX<SubCategoryControllerImpl>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.h),
            child: GridView.builder(
              itemCount: controller.movieslist.isEmpty
                  ? 10
                  : controller.movieslist.length + 2,
              controller: controller.controller,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 30.w,
                mainAxisSpacing: 30.h,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (controller.movieslist.isEmpty) {
                  return const ZShimmerEffict(width: 150, height: 200);
                } else {
                  if (index < controller.movieslist.length) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => const DetailsScreen(), arguments: {
                          'id': controller.movieslist[index].id.toString()
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            image: NetworkImage(Constants.imagepath +
                                controller.movieslist[index].posterPath!),
                          ),
                        ),
                        child: CustomItemDetails(
                          model: controller.movieslist[index],
                        ),
                      ),
                    );
                  } else {
                    return contrller.hasMore
                        ? const ZShimmerEffict(width: 75, height: 100)
                        : Center(
                            child: Text(
                              'No more Data!',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          );
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
