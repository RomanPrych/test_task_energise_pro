import 'package:test_task_energise_pro/common/di/di.dart';
import 'package:test_task_energise_pro/data/ip_info_database/ip_info_database.dart';
import 'package:test_task_energise_pro/data/models/ip_response.dart';
import 'package:test_task_energise_pro/data/repo/get_info_by_ip/get_info_by_ip_repo.dart';
import 'package:test_task_energise_pro/data/repo/get_ip/get_ip_repo.dart';

class MapUseCase {
  final GetIpRepo _getIpRepo = locator.get<GetIpRepo>();
  final GetInfoByIpRepo _getInfoByIpRepo = locator.get<GetInfoByIpRepo>();
  final IpInfoDatabase _infoDatabase = locator.get<IpInfoDatabase>();

  Future<IpResponseModel?> _getDataAndSaveInDataBase() async {
    String? ip = await _getIpRepo.getIp();
    if (ip == null) {
      return null;
    }
    IpResponseModel? model = await _getInfoByIpRepo.getInfo(ip);
    if (model == null) {
      return null;
    } else {
      _infoDatabase.addIpInfoModel(model);
      return model;
    }
  }

  Future<IpResponseModel?> getInfo() async {
    IpResponseModel? model = await _getDataAndSaveInDataBase();
    if (model != null) {
      return model;
    } else {
      return await _infoDatabase.getIpInfoModel();
    }
  }
}
