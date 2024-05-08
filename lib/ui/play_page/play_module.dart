import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_energise_pro/ui/play_page/play_controller.dart';
import 'package:test_task_energise_pro/ui/play_page/play_view.dart';

class PlayModule extends StatelessWidget {
  const PlayModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayController>(
      create: (_) => PlayController(),
      child: const PlayView(),
    );
  }
}
