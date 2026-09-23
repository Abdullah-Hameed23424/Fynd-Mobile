import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class OtpBtn extends StatelessWidget {
  final String email;
  final TextEditingController otpController;
  const OtpBtn({super.key, required this.email, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is VerifyOtpLoading) {
          return const AppLoading();
        }
        return AnimatedItem(
          index: 4,
          child: CustomButton(
            backgroundColor: Colors.transparent,
            label: 'Send',
            onPressed: () {
              context.read<AuthBloc>().add(
                VerifyOtpEvent(email: email, otp: otpController.text.trim()),
              );
            },
            radius: 14.r,
          ),
        );
      },
    );
  }
}
