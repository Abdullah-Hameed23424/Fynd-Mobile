import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/di/auth_dependencies.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/navigation/route_arguments.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/utils/custom_timer.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:fynd/feature/auth/presentation/widgets/otp_footer.dart';
import 'package:fynd/feature/auth/presentation/widgets/otp_pinput.dart';
import 'package:fynd/feature/auth/presentation/widgets/title_and_description.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final GlobalKey<FormState> _otpKey;
  late final TextEditingController _otpController;
  late final CustomTimer _timer;

  @override
  void initState() {
    _otpKey = GlobalKey<FormState>();
    _otpController = TextEditingController();
    _timer = CustomTimer(initialSeconds: 59);
    _timer.start(59);
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => createAuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          bottom: AppBar(
            leading: AuthAnimatedItem(
              index: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Image.asset(AppImages.appLogo),
              ),
            ),
            title: const AuthAnimatedItem(index: 0, child: Text('Fynd')),
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
                    child: BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is VerifyOtpSuccess) {
                          snackBarService.showSuccess(
                            message: 'OTP verified successfully',
                          );
                          NavigationCoordinator.toResetPassword(
                            args: ResetPasswordArguments(
                              resetToken: state.resetToken,
                            ),
                          );
                        } else if (state is VerifyOtpError) {
                          snackBarService.showError(message: state.msg);
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 32.h),

                          const TitleAndDescription(
                            title: 'Verify Your Code',
                            description:
                                'Enter the verification code sent to your email to reset your password',
                          ),

                          SizedBox(height: 28.h),

                          Builder(
                            builder: (context) {
                              return OtpPinput(
                                enable: true,
                                otpController: _otpController,
                                onCompleted: (code) {
                                  context.read<AuthBloc>().add(
                                    VerifyOtpEvent(
                                      email: widget.email,
                                      otp: _otpController.text.trim(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),

                          SizedBox(height: 100.h),

                          OtpFooter(
                            timer: _timer,
                            email: widget.email,
                            otpController: _otpController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
