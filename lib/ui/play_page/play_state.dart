import 'package:equatable/equatable.dart';
import 'package:test_task_energise_pro/ui/play_page/play_model_data.dart';

class PlayState extends Equatable {
  @override
  List<Object?> get props => [double.nan];
}

class LoadingPlayState extends PlayState {
  @override
  List<Object?> get props => [double.nan];
}

class PlayStateData extends PlayState {
  PlayStateData(
    this.data,
  );

  final PlayModelData data;

  @override
  List<Object?> get props => [double.nan];
}
