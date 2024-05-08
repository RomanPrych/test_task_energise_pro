import 'package:equatable/equatable.dart';
import 'package:test_task_energise_pro/ui/map_page/map_model_data.dart';

class MapState extends Equatable {
  @override
  List<Object?> get props => [double.nan];
}

class LoadingMapState extends MapState {
  @override
  List<Object?> get props => [double.nan];
}

class MapStateData extends MapState {
  MapStateData(
      this.data,
      );

  final MapModelData data;

  @override
  List<Object?> get props => [double.nan];
}
