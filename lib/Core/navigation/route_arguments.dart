// Generic route arguments
class RouteArguments {
  final Map<String, dynamic> data;

  RouteArguments(this.data);
}

/// Product Detail Arguments
class OtpArguments {
  final String email;

  OtpArguments({required this.email});
}

/// Product Detail Arguments
class ProductDetailArguments {
  final String productId;
  final String? productName;

  ProductDetailArguments({required this.productId, this.productName});
}

/// User Detail Arguments
class UserDetailArguments {
  final String userId;
  final String? userName;

  UserDetailArguments({required this.userId, this.userName});
}

/// Settings Arguments
class SettingsArguments {
  final String? initialTab;
  final bool? showNotifications;

  SettingsArguments({this.initialTab, this.showNotifications});
}

/// Add more argument models as needed for each route
