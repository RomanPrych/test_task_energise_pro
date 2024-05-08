import 'package:test_task_energise_pro/data/models/ip_response.dart';

abstract interface class GetInfoByIpRepo {
  Future <IpResponseModel?> getInfo(String? ip);
}