import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/constants/app_images.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            AppImages.noDataImage,
            colorBlendMode: BlendMode.srcIn,
            color: Colors.black,
            width: 100.w,
          ),
          SizedBox(height: 10.h),

          const Text('No Data'),
        ],
      ),
    );
  }
}
