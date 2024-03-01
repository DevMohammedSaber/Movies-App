import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies_app/utils/constants/colors.dart';
import 'package:movies_app/utils/helpers/helper_functions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Container(
      height: 70.h,
      width: 70.w,
      margin: EdgeInsets.only(top: 16.h, left: 16.w),
      decoration: BoxDecoration(
        color: dark ? ZColors.dark : ZColors.light,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
    );
  }
}
