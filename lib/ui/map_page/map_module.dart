import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_energise_pro/ui/map_page/map_controller.dart';
import 'package:test_task_energise_pro/ui/map_page/map_view.dart';

class MapModule extends StatelessWidget {
  const MapModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapControllerBloc>(
      create: (_) => MapControllerBloc(),
      child: const MapView(),
    );
  }
}
