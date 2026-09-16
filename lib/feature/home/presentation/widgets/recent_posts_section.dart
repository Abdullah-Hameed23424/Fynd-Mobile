import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';

class RecentPostsSection extends StatelessWidget {
  const RecentPostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Recent Posts', style: context.titleMedium19),
            TextButton(onPressed: () {}, child: Text('See all')),
          ],
        ),

        SizedBox(height: 14.h),
        ListView.separated(
          itemBuilder: (context, index) => Container(),
          separatorBuilder: (context, index) => SizedBox(height: 14.h),
          itemCount: 3,
        ),
      ],
    );
  }
}
