import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/auth_repository.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/utils/debouncer.dart';

class SignUpPageProvider with ChangeNotifier {
  AuthRepository get _authRepository => locator<AuthRepository>();

  SignUpPageProvider() {
    firstNameController.addListener(_fieldValidationListener);
    lastNameController.addListener(_fieldValidationListener);
    emailController.addListener(_fieldValidationListener);
    passwordController.addListener(_fieldValidationListener);
  }

  @override
  void dispose() {
    firstNameController.removeListener(_fieldValidationListener);
    firstNameController.dispose();
    lastNameController.removeListener(_fieldValidationListener);
    lastNameController.dispose();
    emailController.removeListener(_fieldValidationListener);
    emailController.dispose();
    passwordController.removeListener(_fieldValidationListener);
    passwordController.dispose();
    super.dispose();
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Debouncer _debouncer = Debouncer(delayMilliseconds: 800);

  String? firstNameFieldErrorMessage;
  String? lastNameFieldErrorMessage;
  String? emailFieldErrorMessage;

  bool loading = false;

  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void _fieldValidationListener() {
    _debouncer.run(() {
      validateFirstName(firstNameController.text);
      validateLastName(lastNameController.text);
      validateEmail(emailController.text);
      notifyListeners();
    });
  }

  void validateFirstName(String? value, [bool checkIfEmpty = false]) {
    if (value == null || (checkIfEmpty && value.isEmpty)) {
      firstNameFieldErrorMessage = LocaleKeys.first_name_cannot_be_empty.tr();
    } else {
      firstNameFieldErrorMessage = null;
    }
  }

  void validateLastName(String? value, [bool checkIfEmpty = false]) {
    if (value == null || (checkIfEmpty && value.isEmpty)) {
      lastNameFieldErrorMessage = LocaleKeys.last_name_cannot_be_empty.tr();
    } else {
      lastNameFieldErrorMessage = null;
    }
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
      emailFieldErrorMessage = null;
    } else if (checkIfEmpty && value.isEmpty) {
      emailFieldErrorMessage = LocaleKeys.email_cannot_be_empty.tr();
    } else if (!regexp.hasMatch(value) && value.isNotEmpty) {
      emailFieldErrorMessage = LocaleKeys.email_is_not_valid.tr();
    } else {
      emailFieldErrorMessage = null;
    }
  }

  Color get passwordStrengthColor => passwordStrength == 'weak'
      ? AppColors.error
      : passwordStrength == 'medium'
          ? AppColors.warning
          : passwordStrength == 'strong'
              ? AppColors.info
              : passwordStrength == 'excellent'
                  ? AppColors.success
                  : Colors.black;

  bool get isFormValid => !hasAnyEmptyField && passwordStrength == 'excellent';

  bool get hasAnyEmptyField =>
      firstNameController.text.isEmpty ||
      lastNameController.text.isEmpty ||
      emailController.text.isEmpty ||
      passwordController.text.isEmpty;

  bool get passwordHaveWhiteSpaces => _whiteSpaceCheck.hasMatch(passwordController.text);

  bool get hasNameOrEmailInPassword {
    final name = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    if (name.isEmpty || email.isEmpty) return false;
    return passwordController.text.toLowerCase().contains(name.toLowerCase()) ||
        passwordController.text.toLowerCase().contains(email.toLowerCase()) ||
        passwordController.text.toLowerCase().contains(lastName.toLowerCase());
  }

  bool get passwordHasEnoughCharacters => _passwordLengthCheck.hasMatch(passwordController.text);

  bool get passwordHasAnySymbolAndNumber =>
      _hasAnySymbolAndNumber.hasMatch(passwordController.text);

  final _whiteSpaceCheck = RegExp(r'^[^\s]+$');
  final _passwordLengthCheck = RegExp(r'^.{8,}$');
  final _hasAnySymbolAndNumber = RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]');

  String get passwordStrength {
    int strength = 0;
    if (passwordController.text.isEmpty) return 'none';
    if (passwordHasEnoughCharacters) strength++;
    if (!hasNameOrEmailInPassword) strength++;
    if (passwordHasAnySymbolAndNumber && passwordHasEnoughCharacters) strength++;
    if (passwordHaveWhiteSpaces) strength++;
    switch (strength) {
      case 0:
        return 'none';
      case 1:
        return 'weak';
      case 2:
        return 'medium';
      case 3:
        return 'strong';
      case 4:
        return 'excellent';
      default:
        return 'none';
    }
  }

  Future<bool> signUp() async {
    validateFirstName(firstNameController.text, true);
    validateLastName(lastNameController.text, true);
    validateEmail(emailController.text, true);
    if (!isFormValid) return false;
    try {
      loading = true;
      notifyListeners();
      final user = await _authRepository.registerWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
        name: '${firstNameController.text.trim()} ${lastNameController.text.trim()}',
      );
      loading = false;
      notifyListeners();
      return user != null;
    } catch (e) {
      loading = false;
      notifyListeners();
      return false;
    }
  }
}
