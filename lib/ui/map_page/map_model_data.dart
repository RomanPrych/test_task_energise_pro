import 'package:flutter_map/flutter_map.dart';
import 'package:test_task_energise_pro/data/models/ip_response.dart';

class MapModelData {
  MapModelData({
    this.ipResponseModel,
    this.controller,
    this.isLoadingButton,
  });

  IpResponseModel? ipResponseModel;
  MapController? controller;
  bool? isLoadingButton;

  bool get getIsLoadingButton => isLoadingButton == true;
}
