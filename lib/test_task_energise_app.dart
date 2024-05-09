import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_task_energise_pro/common/localization/app_localizations.dart';
import 'package:test_task_energise_pro/common/localization/locate_provider.dart';
import 'package:test_task_energise_pro/ui/home/home_controller.dart';
import 'package:test_task_energise_pro/ui/home/home_view.dart';

class TestTaskEnergiseApp extends StatelessWidget {
  const TestTaskEnergiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeController>(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        ),
      ],
      child: Consumer<LocaleProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            locale: value.locale,
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en', ''),
              Locale('de', ''),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
