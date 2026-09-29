import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';

class PostTypeSelectorBtn extends StatelessWidget {
  final Color color;
  final String label;
  final int index;
  final int selectedIndex;
  final GestureTapCallback onTap;
  const PostTypeSelectorBtn({
    super.key,
    required this.color,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: 1.sw / 2 - 17.w,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25.r),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: (index == selectedIndex)
                      ? color.withAlpha(50)
                      : Colors.white,
                  border: Border.all(
                    color: (index == selectedIndex)
                        ? color
                        : const Color(0xffE0E5ED),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: context.bodyMedium16.copyWith(
                    color: (index == selectedIndex) ? color : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
