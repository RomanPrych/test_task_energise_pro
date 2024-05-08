import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
