import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/module/view/details/widgets/custom_geners_container.dart';
import 'package:movies_app/utils/constants/colors.dart';
import 'package:movies_app/utils/constants/constants.dart';

class CustomPosterWidget extends StatelessWidget {
  const CustomPosterWidget({
    super.key,
    required this.model,
  });

  final MovieModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            Constants.imagepath + model!.backdropPath!,
          ),
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: ZColors.darkGrey.withOpacity(.5),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model!.title!,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: ZColors.light, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(' Geners ',
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(
                  width: 250.w,
                  height: 40.h,
                  child: ListView.builder(
                    itemCount: model!.genres!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomGenersContainer(
                        title: model!.genres![index].name!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
