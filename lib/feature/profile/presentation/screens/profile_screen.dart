import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/profile_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/profile/domain/entities/profile_entity.dart';
import 'package:fynd/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fynd/feature/profile/presentation/widgets/choices_list.dart';
import 'package:fynd/feature/profile/presentation/widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => createProfileCubit()..getProfile(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          title: AnimatedItem(
            index: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Profile'),
                SizedBox(height: 4.h),
                Text(
                  'Your account',
                  style: context.bodyMedium16.copyWith(
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Container(
                  height: 1.sh - 250.h,
                  alignment: Alignment.center,
                  child: const AppLoading(),
                );
              } else if (state is ProfileError) {
                return Container(
                  height: 1.sh - 250.h,
                  alignment: Alignment.center,
                  child: TryAgain(
                    onTap: () {
                      context.read<ProfileCubit>().getProfile();
                    },
                    message: state.msg,
                  ),
                );
              } else if (state is ProfileLoaded) {
                final ProfileEntity profileEntity = state.profileEntity;
                return Column(
                  children: <Widget>[
                    ProfileHeader(profileEntity: profileEntity),
                    SizedBox(height: 18.h),
                    const ChoicesList(),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
