import 'package:flutter/material.dart';
import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/navigation/route_arguments.dart';
import 'package:fynd/core/widgets/confirmation_dialog.dart';
import 'package:fynd/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fynd/feature/profile/presentation/widgets/choice_tile.dart';

class ChoicesList extends StatelessWidget {
  final ProfileCubit cubit;
  const ChoicesList({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ChoiceTile(
          title: 'Edit Profile',
          onTap: () {
            NavigationCoordinator.toEditProfile(
              args: EditProfileArguments(
                onSuccess: () {
                  cubit.getProfile();
                },
              ),
            );
          },
        ),
        const ChoiceTile(
          title: 'Notifications',
          onTap: NavigationCoordinator.toNotifications,
        ),
        ChoiceTile(
          title: 'Log out',
          onTap: () {
            ConfirmationDialog.show(
              context,
              title: 'Logout',
              content: 'Are you sure?',
              status: ConfirmationStatus.danger,
              onConfirm: () {
                AppStorage.removeAccessToken();
                AppStorage.removeRefreshToken();
                AppStorage.removeMyId();
                NavigationCoordinator.toLogin();
              },
            );
          },
        ),
        ChoiceTile(title: 'Delete Account', onTap: () {}),
      ],
    );
  }
}
