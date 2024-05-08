import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:test_task_energise_pro/data/ip_info_database/ip_info_database.dart';
import 'package:test_task_energise_pro/data/models/ip_response.dart';

class IpInfoDatabaseImpl implements IpInfoDatabase {
  const IpInfoDatabaseImpl(
    this.init,
  );

  final ({Database dataBase, StoreRef storeRef}) init;

  @override
  Future<bool> addIpInfoModel(IpResponseModel? model) async {
      try {
        await init.storeRef.record(0).add(init.dataBase, model?.toJson());
        return await _isExist(0);
      } catch (e) {
        print('⚠⚠⚠ addIpInfoModel error =  $e');
        return false;
      }
  }

  @override
  Future<bool> clearIpInfoModel() async {
      try {
        await init.storeRef.record(0).delete(init.dataBase);
        return true;
      } catch (e) {
        debugPrint('⚠⚠⚠ clearIpInfoDatabase error =  $e');
        return false;
      }
  }

  @override
  Future<IpResponseModel?> getIpInfoModel() async {
      try {
        var result = await init.storeRef.record(0).get(init.dataBase);
        return IpResponseModel.fromJson(result as Map<String, dynamic>);
      } catch (e) {
        debugPrint('⚠⚠⚠ getIpInfoModel error =  $e');
        return null;
      }
  }



  Future<bool> _isExist(int number) async {
    try {
      return await init.storeRef.record(number).exists(init.dataBase);
    } catch (e) {
      debugPrint('⚠⚠⚠  _isExist error =  $e');
      return false;
    }
  }
}
