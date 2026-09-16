abstract class AuthRepository {
  Future<void> login({required String email, required String password});

  Future<void> register({
    required String fullname,
    required String email,
    required String password,
  });

  Future<void> forgetPassword({required String email});

  Future<String> verifyOtp({required String email, required String otp});

  Future<void> resetPassword({
    required String resetToken,
    required String password,
    required String confirmPassword,
  });
}
