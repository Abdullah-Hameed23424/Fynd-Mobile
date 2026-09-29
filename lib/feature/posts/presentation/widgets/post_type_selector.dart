import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/feature/posts/domain/params/post_filter.dart';
import 'package:fynd/feature/posts/presentation/widgets/post_type_selector_btn.dart';

// ignore: must_be_immutable
class PostTypeSelector extends StatefulWidget {
  PostFilter? filter;
  final ValueChanged<int?> onChanged;
  final String leftBtnLabel;
  final String rightBtnLabel;
  PostTypeSelector({
    super.key,
    this.filter,
    required this.onChanged,
    required this.leftBtnLabel,
    required this.rightBtnLabel,
  });

  @override
  State<PostTypeSelector> createState() => _PostTypeSelectorState();
}

class _PostTypeSelectorState extends State<PostTypeSelector> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        PostTypeSelectorBtn(
          color: AppColors.errorColor,
          label: widget.leftBtnLabel,
          index: 0,
          selectedIndex: selectedIndex,
          onTap: () {
            if (selectedIndex == 0) {
              selectedIndex = -1;
              if (widget.filter != null) {
                widget.filter = widget.filter!.copyWith(type: null);
              }
              widget.onChanged.call(null);
            } else {
              selectedIndex = 0;
              if (widget.filter != null) {
                widget.filter = widget.filter!.copyWith(type: 0);
              }
              widget.onChanged.call(0);
            }
            setState(() {});
          },
        ),

        SizedBox(width: 10.w),

        PostTypeSelectorBtn(
          color: AppColors.greenColor,
          label: widget.rightBtnLabel,
          index: 1,
          selectedIndex: selectedIndex,
          onTap: () {
            if (selectedIndex == 1) {
              selectedIndex = -1;
              if (widget.filter != null) {
                widget.filter = widget.filter!.copyWith(type: null);
              }
              widget.onChanged.call(null);
            } else {
              selectedIndex = 1;
              if (widget.filter != null) {
                widget.filter = widget.filter!.copyWith(type: 1);
              }
              widget.onChanged.call(1);
            }
            setState(() {});
          },
        ),
      ],
    );
  }
}
