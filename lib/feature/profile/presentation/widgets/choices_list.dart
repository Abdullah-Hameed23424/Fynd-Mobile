import 'package:flutter/material.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/feature/profile/presentation/widgets/choice_tile.dart';

class ChoicesList extends StatelessWidget {
  const ChoicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ChoiceTile(
          title: 'Edit Profile',
          onTap: NavigationCoordinator.toEditProfile,
        ),
        ChoiceTile(title: 'Notifications', onTap: () {}),
        ChoiceTile(title: 'Appearance', onTap: () {}),
        ChoiceTile(title: 'Log out', onTap: () {}),
        ChoiceTile(title: 'Delete Account', onTap: () {}),
      ],
    );
  }
}
