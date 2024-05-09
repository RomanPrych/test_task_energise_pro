import 'package:flutter/material.dart';
import 'package:test_task_energise_pro/common/constants.dart';
import 'package:test_task_energise_pro/common/di/di.dart';
import 'package:test_task_energise_pro/common/enums/supported_locales.dart';
import 'package:test_task_energise_pro/common/localization/app_locale.dart';
import 'package:test_task_energise_pro/data/repo/shared_preferences/shared_preference.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider() {
    _getSavedLocale();
  }

  Locale? _locale;

  Locale? get locale => _locale;
  final SharedPreference sharedPreference = locator.get<SharedPreference>();

  Future<void> _getSavedLocale() async {
    String localeSaved =
        await sharedPreference.getStringPreferenceValue(Const.localeLng);
    _locale = localeSaved.localeFromString();
    notifyListeners();
  }

  void setLocale(SupportedLocales? appLocale) {
    _locale = appLocale?.toLocale();
    notifyListeners();
    _saveLocale(appLocale);
  }

  Future<void> _saveLocale(SupportedLocales? appLocale) async {
    if(appLocale == null){print('return');
      return;
    }
    await sharedPreference.setStringPreferenceValue(
      Const.localeLng,
      appLocale.value,
    );
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
