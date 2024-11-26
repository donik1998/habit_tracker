import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/auth_repository.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/utils/debouncer.dart';

class SignInPageProvider extends ChangeNotifier {
  AuthRepository get _authRepository => locator<AuthRepository>();

  SignInPageProvider() {
    emailController.addListener(_validateFields);
    passwordController.addListener(_validateFields);
  }

  @override
  void dispose() {
    emailController.removeListener(_validateFields);
    emailController.dispose();
    passwordController.removeListener(_validateFields);
    passwordController.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? emailErrorMessage;
  String? passwordErrorMessage;
  final Debouncer _validateDebouncer = Debouncer(delayMilliseconds: 800);

  bool obscurePassword = true;
  bool loading = false;

  void _validateFields() {
    _validateDebouncer.run(() {
      validateEmail(emailController.text);
      validatePassword(passwordController.text);
      notifyListeners();
    });
  }

  void validateEmail(String? value, [bool checkIfEmpty = false]) {
    final regexp = RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
    if (value == null) {
      emailErrorMessage = null;
    } else if (checkIfEmpty && value.isEmpty) {
      emailErrorMessage = LocaleKeys.email_cannot_be_empty.tr();
    } else if (!regexp.hasMatch(value) && value.isNotEmpty) {
      emailErrorMessage = LocaleKeys.email_is_not_valid.tr();
    } else {
      emailErrorMessage = null;
    }
  }

  void validatePassword(String? value, [bool checkIfEmpty = false]) {
    if (value == null) {
      passwordErrorMessage = null;
    } else if (checkIfEmpty && value.isEmpty) {
      passwordErrorMessage = LocaleKeys.password_cannot_be_empty.tr();
    } else {
      passwordErrorMessage = null;
    }
  }

  bool get isFormValid =>
      emailErrorMessage == null && passwordErrorMessage == null && !hasAnyEmptyField;

  bool get hasAnyEmptyField => emailController.text.isEmpty || passwordController.text.isEmpty;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<bool> signInWithEmailAndPassword() async {
    validateEmail(emailController.text, true);
    validatePassword(passwordController.text, true);
    if (!isFormValid) return false;
    try {
      loading = true;
      notifyListeners();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final val =
          await _authRepository.signInWithEmailAndPassword(email: email, password: password);
      loading = false;
      notifyListeners();
      return val != null;
    } catch (e) {
      loading = false;
      passwordErrorMessage = LocaleKeys.something_went_wrong.tr();
      notifyListeners();
      return false;
    }
  }
}
