import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_task_energise_pro/common/di/di.dart';
import 'package:test_task_energise_pro/data/models/ip_response.dart';
import 'package:test_task_energise_pro/data/repo/get_info_by_ip/get_info_by_ip_repo.dart';

class GetInfoByIpRepoImpl implements GetInfoByIpRepo {
  final Dio dio = locator.get<Dio>();

  @override
  Future<IpResponseModel?> getInfo(String? ip) async {
    try {
      if (ip == null || ip.isEmpty) {
        return null;
      }
      var response = await dio.get('http://ip-api.com/json/$ip');
      if (response.statusCode == 200) {
        return IpResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("ERROR GetInfoByIpRepoImpl =$e");
      return null;
    }
  }
}
