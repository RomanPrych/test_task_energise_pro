import 'package:equatable/equatable.dart';
import 'package:test_task_energise_pro/ui/home/home_model_data.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [double.nan];
}

class LoadingHomeState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateData extends HomeState {
  HomeStateData(this.homeModelData);

  final HomeModelData homeModelData;

  @override
  List<Object?> get props => [
        double.nan,
      ];
}
