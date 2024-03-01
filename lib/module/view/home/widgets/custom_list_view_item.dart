import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/module/view/details/details_screen.dart';
import 'package:movies_app/module/view/home/widgets/custom_item_details.dart';
import 'package:movies_app/utils/constants/constants.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.model});
  final MovieModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const DetailsScreen(), arguments: model.id.toString());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          width: 150,
          height: 200,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image: NetworkImage(Constants.imagepath + model.posterPath!),
            ),
          ),
          child: CustomItemDetails(model: model),
        ),
      ),
    );
  }
}
