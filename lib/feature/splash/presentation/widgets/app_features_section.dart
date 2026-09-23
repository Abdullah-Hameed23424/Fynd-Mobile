import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/feature/splash/presentation/widgets/app_feature_card.dart';

class AppFeaturesSection extends StatelessWidget {
  const AppFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const AppFeatureCard(label: 'Verified posts'),
        SizedBox(width: 10.w),
        const AppFeatureCard(label: 'Community first'),
      ],
    );
  }
}
