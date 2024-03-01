import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movies_app/utils/constants/colors.dart';
import 'package:movies_app/utils/helpers/helper_functions.dart';

class ZShimmerEffict extends StatelessWidget {
  const ZShimmerEffict(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width.h,
        height: height.w,
        decoration: BoxDecoration(
          color: color ?? (dark ? ZColors.grey : ZColors.light),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
