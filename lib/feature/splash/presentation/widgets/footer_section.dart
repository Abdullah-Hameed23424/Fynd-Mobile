import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> badgeColors = [
      const Color(0xffFF9A8B),
      const Color(0xffFFD166),
      const Color(0xff2563EB),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Swipe up to begin',
          style: context.headlineSmall12.copyWith(
            color: AppColors.textGray,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 4.w),
              child: Badge(smallSize: 8.w, backgroundColor: badgeColors[index]),
            ),
          ),
        ),
      ],
    );
  }
}
