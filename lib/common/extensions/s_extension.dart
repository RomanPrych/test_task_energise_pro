import 'package:flutter/material.dart';
import 'package:test_task_energise_pro/common/localization/app_localizations.dart';

extension ExtensionString on BuildContext {
  String s(String key) => AppLocalizations.of(this)!.translate(key)!;
}