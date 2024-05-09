import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:test_task_energise_pro/common/di/di.dart';
import 'package:test_task_energise_pro/data/repo/get_ip/get_ip_repo.dart';

class GetIpRepoImpl implements GetIpRepo {
  final Dio dio = locator.get<Dio>();

  @override
  Future<String?> getIp() async {
    try {
      var response = await dio.get('https://api.ipify.org?format=json');
      if (response.statusCode == 200) {
        return response.data['ip'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('ERROR GetIpRepoImpl = $e');
      return null;
    }
  }
}
