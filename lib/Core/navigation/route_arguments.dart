// Generic route arguments
class RouteArguments {
  final Map<String, dynamic> data;

  RouteArguments(this.data);
}

class OtpArguments {
  final String email;
  OtpArguments({required this.email});
}

class ResetPasswordArguments {
  final String resetToken;
  ResetPasswordArguments({required this.resetToken});
}

class NavBarArguments {
  final int? index;
  NavBarArguments({required this.index});
}
