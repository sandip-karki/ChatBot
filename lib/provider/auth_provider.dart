import 'package:chat_bot/helper/auth_repo_impl.dart';
import 'package:flutter/widgets.dart';

class Authprovider with ChangeNotifier {
  AuthRepoImpl? _repo;
  Authprovider() {
    _repo = AuthRepoImpl();
  }
  bool _isLoading = false;
  bool get isloding => _isLoading;
  String _loadingText = 'Please wait..';
  String get loadingText => _loadingText;
  Future<String> login(
      {required String email, required String password}) async {
    _isLoading = true;
    _loadingText = 'logging in.. ';
    notifyListeners();
    String result = 'ok';
    try {
      final res = await _repo!.login(email: email, password: password);
      print(res);
    } catch (e) {
      result = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<String> register(
      {required String email,
      required String password,
      required String name}) async {
    _isLoading = true;
    _loadingText = 'Creating user..';

    notifyListeners();
    String result = 'ok';
    try {
      final res =
          await _repo!.register(email: email, password: password, name: name);
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<String> forgotpassword({
    required String email,
  }) async {
    _isLoading = true;
    _loadingText = 'Please wait..';

    notifyListeners();
    String result = 'ok';
    try {
      final res = await _repo!.forgotpassword(
        email: email,
      );
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }

  String logout() {
    _isLoading = true;
    _loadingText = 'Please wait..';

    notifyListeners();
    String result = 'ok';
    try {
      final res = _repo!.logout();
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }

  String verifyemail({required String email}) {
    _isLoading = true;
    _loadingText = 'please wait';
    notifyListeners();
    String result = 'ok';
    try {
      final res = _repo!.verifyemail();
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }

  String verifyNumber({
    required int number,
  }) {
    _isLoading = true;
    _loadingText = 'please wait';
    notifyListeners();
    String result = 'ok';
    try {
      final res = _repo!.verifynumber(number: number);
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
}
