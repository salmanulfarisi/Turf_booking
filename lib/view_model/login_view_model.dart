import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  bool isLoading = false;

  Future<void> loginUser() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 10));
    isLoading = false;
    notifyListeners();
  }

  isobscure() {
    obscure = !obscure;
    notifyListeners();
  }
}
