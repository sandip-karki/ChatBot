abstract class Authrepo {
  Future login({
    required String email,
    required String password,
  });
  Future register({
    required String email,
    required String password,
    required String name,
  });
  Future logout();
  Future verifynumber({
    required int number,
  });
  Future forgotpassword({required String email});
  Future verifyemail();
}
