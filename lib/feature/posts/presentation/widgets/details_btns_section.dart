import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';

class DetailsBtnsSection extends StatelessWidget {
  final PostEntity postData;
  const DetailsBtnsSection({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedItem(
          index: 7,
          child: CustomButton(
            label: 'Contact owner',
            onPressed: () {
              log(postData.userEmail);
              // EasyUrlLauncher
            },
            radius: 22.r,
            backgroundColor: Colors.transparent,
          ),
        ),

        SizedBox(height: 12.h),

        AnimatedItem(
          index: 8,
          child: CustomButton(
            label: 'Report this post',
            onPressed: () {},
            radius: 22.r,
            backgroundColor: Colors.white,
            buttonStyle: context.bodyMedium16.copyWith(
              color: AppColors.errorColor,
              fontWeight: FontWeight.bold,
            ),
            border: const BorderSide(color: Color(0xffE0E5ED)),
          ),
        ),
      ],
    );
  }
}
