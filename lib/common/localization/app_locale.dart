import 'dart:ui';

import 'package:test_task_energise_pro/common/enums/supported_locales.dart';

extension ToLocale on SupportedLocales {
  Locale toLocale() {
    for (var appLocale in SupportedLocales.values) {
      if (value == appLocale.value) {
        return Locale(value, '');
      }
    }
    return const Locale('en', '');
  }
}

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

extension ToAppLocale on Locale? {
  SupportedLocales toAppLocale() {
    if (this == null) {
      return SupportedLocales.en;
    }
    for (var element in SupportedLocales.values) {
      if (element.value == this!.languageCode) {
        return element;
      }
    }
    return SupportedLocales.en;
  }
}
