import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_energise_pro/common/extensions/double_extension.dart';
import 'package:test_task_energise_pro/ui/play_page/play_controller.dart';
import 'package:test_task_energise_pro/ui/play_page/play_state.dart';
import 'package:test_task_energise_pro/ui/widgets/display_time_pulsating_widget.dart';
import 'package:test_task_energise_pro/ui/widgets/loading_widget.dart';

class PlayView extends StatelessWidget {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayController, PlayState>(
      builder: (context, state) {
        if (state is PlayStateData) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DisplayTimePulsatingWidget(
                  isWorking: state.data.getIsPlayed,
                  child: Text(
                    '${state.data.getHours}:${state.data.getMinutes}:${state.data.getSeconds}',
                    style: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
                DisplayTimePulsatingWidget(
                  isWorking: !state.data.getIsPlayed,
                  child: GestureDetector(
                    onTap: () =>
                        context.read<PlayController>()..onPlayPauseTap(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            state.data.getIsPlayed ? Colors.greenAccent : Colors.red,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(state.data.getIsPlayed ? 'assets/pause.svg' : 'assets/play.svg',),
                          10.0.wsb,
                          Text(
                            state.data.getIsPlayed ? 'PAUSE' : 'PLAY',
                            style: const TextStyle(
                              fontSize: 36,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
