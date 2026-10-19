import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/core/widgets/custom_card.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/core/widgets/title_and_description.dart';
import 'package:fynd/feature/profile/presentation/widgets/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final GlobalKey<FormState> _editProfileKey;
  late final TextEditingController _fullnameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    _editProfileKey = GlobalKey<FormState>();
    _fullnameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: AnimatedItem(
          index: 0,
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            height: 48.w,
            width: 48.w,
            child: const Center(child: PopButton()),
          ),
        ),

        centerTitle: true,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomCard(
                        children: <Widget>[
                          const TitleAndDescription(
                            title: 'Edit Profile',
                            description:
                                'Update and Manage Profile Information',
                          ),

                          SizedBox(height: 16.h),
                          EditProfileForm(
                            editProfileKey: _editProfileKey,
                            fullnameController: _fullnameController,
                            phoneNumberController: _phoneNumberController,
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      AnimatedItem(
                        index: 7,
                        child: CustomButton(
                          label: 'Update',
                          onPressed: () {},
                          radius: 22.r,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
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
