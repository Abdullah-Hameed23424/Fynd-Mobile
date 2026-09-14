abstract class AuthRepository {
  Future<void> login({required String email, required String password});

  Future<void> register({
    required String fullname,
    required String email,
    required String password,
  });

  Future<void> forgetPassword({required String email});

  Future<void> verifyOtp({required String email, required String otp});
}
