import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/utils/constants/colors.dart';

class CustomItemDetails extends StatelessWidget {
  const CustomItemDetails({
    super.key,
    required this.model,
  });

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10.h,
          left: 10.w,
          child: Container(
            padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              color: ZColors.darkGrey.withOpacity(.7),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                ),
                Text(
                  model.voteAverage!.toStringAsFixed(1),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ZColors.light,
                      ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: ZColors.darkGrey.withOpacity(.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              model.releaseDate!.substring(0, model.releaseDate!.indexOf('-')),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ZColors.light,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
