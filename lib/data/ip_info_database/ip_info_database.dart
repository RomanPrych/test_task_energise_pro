
import 'package:test_task_energise_pro/data/models/ip_response.dart';

abstract class IpInfoDatabase {

  Future<bool> clearIpInfoModel();

  Future<bool> addIpInfoModel(IpResponseModel? model);

  Future<IpResponseModel?> getIpInfoModel();

}