import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:test_task_energise_pro/common/di/di.dart';
import 'package:test_task_energise_pro/data/use_cases/map_use_case.dart';
import 'package:test_task_energise_pro/ui/map_page/map_model_data.dart';
import 'package:test_task_energise_pro/ui/map_page/map_state.dart';
import 'package:latlong2/latlong.dart';

class MapControllerBloc extends Cubit<MapState> {
  MapControllerBloc() : super(LoadingMapState()) {
    emit(MapStateData(_data));
    _data.controller = _mapController;
    getData();
  }

  final MapUseCase _mapUseCase = locator.get<MapUseCase>();
  final MapController _mapController = MapController();
  final MapModelData _data = MapModelData();

  Future<void> getData() async {
    _data.isLoadingButton = true;
    emit(MapStateData(_data));
    _data.ipResponseModel = await _mapUseCase.getInfo();
    if (_data.ipResponseModel != null &&
        _data.ipResponseModel?.lat != null &&
        _data.ipResponseModel?.lon != null) {
      _mapController.move(
          LatLng(_data.ipResponseModel!.lat!, _data.ipResponseModel!.lon!), 6);
    }
    _data.isLoadingButton = false;
    emit(MapStateData(_data));
  }
}
