import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/date_formatter.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/presentation/widgets/label_content_widget.dart';

class OtherDetailsInfoSection extends StatelessWidget {
  final PostEntity postData;
  const OtherDetailsInfoSection({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xffE0E5ED)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedItem(
            index: 5,
            child: LabelContentWidget(
              label: 'Location',
              content: postData.location,
            ),
          ),

          Divider(color: AppColors.iconColor.withAlpha(100), height: 26.h),

          AnimatedItem(
            index: 6,
            child: LabelContentWidget(
              label: 'Date',
              content: DateFormatter.format(postData.date ?? DateTime.now()),
            ),
          ),
        ],
      ),
    );
  }
}
