import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/module/view/home/widgets/custom_list_view_item.dart';
import 'package:movies_app/common/shimmers/shimmer_effect.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<List<MovieModel>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: SizedBox(
        height: 200.h,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            List<MovieModel> moviesList = [];
            if (snapshot.hasData) {
              moviesList = snapshot.data as List<MovieModel>;
            }
            return !snapshot.hasData
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: const ZShimmerEffict(width: 150, height: 200))
                : CustomListViewItem(model: moviesList[index]);
          },
        ),
      ),
    );
  }
}
