import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/validators/fullname_validator.dart';
import 'package:fynd/core/utils/validators/phone_number_validator.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';

class EditProfileForm extends StatefulWidget {
  final GlobalKey<FormState> editProfileKey;
  final TextEditingController fullnameController;
  final TextEditingController phoneNumberController;
  const EditProfileForm({
    super.key,
    required this.editProfileKey,
    required this.fullnameController,
    required this.phoneNumberController,
  });

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late final FocusNode _phoneNumberFocusNode;

  @override
  void initState() {
    super.initState();
    _phoneNumberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedItem(
            index: 3,
            child: Text('Fullname', style: context.titleSmall12),
          ),
          SizedBox(height: 4.h),
          AnimatedItem(
            index: 4,
            child: CustomTextField(
              controller: widget.fullnameController,

              prefixIcon: const Icon(Icons.person, color: AppColors.iconColor),
              radius: 14.r,
              hintText: 'e.g. Abdullah Hameed',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: FullNameValidator.validate,
              onFieldSubmitted: (_) {
                _phoneNumberFocusNode.requestFocus();
              },
            ),
          ),

          SizedBox(height: 14.h),
          AnimatedItem(
            index: 5,
            child: Text('Phone Number', style: context.titleSmall12),
          ),
          SizedBox(height: 4.h),
          AnimatedItem(
            index: 6,
            child: CustomTextField(
              controller: widget.phoneNumberController,
              focusNode: _phoneNumberFocusNode,
              prefixIcon: const Icon(Icons.phone, color: AppColors.iconColor),
              radius: 14.r,
              hintText: 'e.g. 987 654 321',
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              validator: PhoneNumberValidator.validate,
              onFieldSubmitted: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
