/// Route Guards for authentication and permissions checking
/// Used to prevent unauthorized navigation

abstract class RouteGuard {
  /// Check if user can navigate to this route
  /// Returns true if allowed, false otherwise
  Future<bool> canActivate();

  /// Message to show if navigation is blocked
  String get blockedMessage;
}

/// Authentication Guard - prevents access to protected routes
class AuthenticationGuard implements RouteGuard {
  final bool isLoggedIn;

  AuthenticationGuard({required this.isLoggedIn});

  @override
  Future<bool> canActivate() async {
    // Simulate checking authentication status
    await Future.delayed(const Duration(milliseconds: 200));
    return isLoggedIn;
  }

  @override
  String get blockedMessage => 'Please login to continue';
}

/// Permission Guard - checks user permissions
class PermissionGuard implements RouteGuard {
  final List<String> requiredPermissions;
  final List<String> userPermissions;

  PermissionGuard({
    required this.requiredPermissions,
    required this.userPermissions,
  });

  @override
  Future<bool> canActivate() async {
    return requiredPermissions.every(
      (permission) => userPermissions.contains(permission),
    );
  }

  @override
  String get blockedMessage => 'You do not have permission to access this page';
}

/// Admin Guard - checks if user is admin
class AdminGuard implements RouteGuard {
  final bool isAdmin;

  AdminGuard({required this.isAdmin});

  @override
  Future<bool> canActivate() async {
    return isAdmin;
  }

  @override
  String get blockedMessage => 'Admin access required';
}

// Add more guards as needed
