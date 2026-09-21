// e.g.:

import 'package:flutter/material.dart';
import 'package:fynd/core/theme/app_colors.dart';

enum RequestStatus { initial, loading, success, error }

enum UserRole { admin, user, guest }

// My Own
enum PostType {
  lost,
  found;

  String get name {
    switch (this) {
      case PostType.lost:
        return 'Lost';
      case PostType.found:
        return 'Found';
    }
  }

  Color get color {
    switch (this) {
      case PostType.lost:
        return AppColors.errorColor;
      case PostType.found:
        return AppColors.greenColor;
    }
  }
}
