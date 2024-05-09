import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_energise_pro/common/extensions/s_extension.dart';
import 'package:test_task_energise_pro/common/extensions/s_keys.dart';
import 'package:test_task_energise_pro/ui/map_page/map_controller.dart';
import 'package:test_task_energise_pro/ui/map_page/map_state.dart';
import 'package:test_task_energise_pro/ui/map_page/widgets/ip_info_widget.dart';
import 'package:test_task_energise_pro/ui/map_page/widgets/map_widget.dart';
import 'package:test_task_energise_pro/ui/widgets/loading_widget.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapControllerBloc, MapState>(
      builder: (context, state) {
        if (state is MapStateData) {
          return RefreshIndicator(
            onRefresh: () async => context.read<MapControllerBloc>().getData(),
            child: ListView(
              children: [
                MapWidget(
                  coordinates: state.data.ipResponseModel?.getLatLng,
                  mapController: state.data.controller,
                ),
                IpInfoWidget(
                  model: state.data.ipResponseModel,
                  isLoading: state.data.isLoadingButton,
                ),
            GestureDetector(
              onTap: context.read<MapControllerBloc>().getData,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(context.s(reload)),
              ),),
              ],
            ),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
