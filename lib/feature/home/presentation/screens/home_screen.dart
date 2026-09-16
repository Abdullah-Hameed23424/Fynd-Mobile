import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_posts_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Add your initialization and initial data here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Fynd'),
            SizedBox(height: 4.h),
            Text(
              'Find it. Return it. Together.',
              style: context.bodyMedium16.copyWith(color: AppColors.textGray),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 80.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextField(
              controller: TextEditingController(),
              radius: 14.r,
              hintText: 'Search lost or found items…',
              keyboardType: TextInputType.text,
              onFieldSubmitted: (value) {},
            ),
          ),
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 22.h),

                      const RecentPostsSection(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
