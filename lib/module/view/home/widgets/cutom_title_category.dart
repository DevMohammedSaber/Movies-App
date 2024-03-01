import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/constants/colors.dart';

class CustomTitleOfCategory extends StatelessWidget {
  const CustomTitleOfCategory(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          InkWell(
            onTap: onPressed,
            child: Text(
              'See More',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ZColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
