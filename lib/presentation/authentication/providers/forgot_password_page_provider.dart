import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/repository/auth_repository.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/utils/debouncer.dart';

class ForgotPasswordPageProvider extends ChangeNotifier {
  AuthRepository get _authRepository => locator<AuthRepository>();

  ForgotPasswordPageProvider() {
    emailController.addListener(_fieldsValidator);
  }

  @override
  void dispose() {
    emailController.removeListener(_fieldsValidator);
    emailController.dispose();
    super.dispose();
  }

  final TextEditingController emailController = TextEditingController();

  String? emailErrorMessage;
  bool loading = false;
  bool hasSentLink = false;
  Debouncer debouncer = Debouncer(delayMilliseconds: 800);

  void _fieldsValidator() {
    debouncer.run(() {
      validateEmail(emailController.text, true);
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

  bool get isFormValid => emailErrorMessage == null && !hasAnyEmptyField;

  bool get hasAnyEmptyField => emailController.text.isEmpty;

  Future<void> sendVerificationLink() async {
    validateEmail(emailController.text, true);
    if (!isFormValid) return;

    try {
      loading = true;
      notifyListeners();
      await _authRepository.resetPassword(emailController.text);
      hasSentLink = true;
      loading = false;
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
