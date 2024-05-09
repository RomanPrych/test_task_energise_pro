import 'package:flutter/material.dart';
import 'package:test_task_energise_pro/common/enums/supported_locales.dart';

extension LocaleFromString on String {
  Locale localeFromString() {
    for (var appLocale in SupportedLocales.values) {
      if (toString() == appLocale.value) {
        return Locale(toString(), '');
      }
    }
    return const Locale('en', '');
  }
}

extension AppLocaleFromString on String {
  SupportedLocales appLocaleFromString() {
    for (var appLocale in SupportedLocales.values) {
      if (this == appLocale.value) {
        return appLocale;
      }
    }
    return SupportedLocales.en;
  }
}