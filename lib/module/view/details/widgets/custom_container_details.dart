import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/constants/colors.dart';

class CustomContainerDetailsScreen extends StatelessWidget {
  const CustomContainerDetailsScreen({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ZColors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          body
        ],
      ),
    );
  }
}
