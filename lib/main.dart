import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task_energise_pro/common/di/di.dart';
import 'package:test_task_energise_pro/test_task_energise_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  await setupLocator();
  runApp(const TestTaskEnergiseApp());
}

