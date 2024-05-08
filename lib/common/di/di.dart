import 'package:get_it/get_it.dart';
import 'package:test_task_energise_pro/data/ip_info_database/init_ip_info.dart';
import 'package:test_task_energise_pro/data/ip_info_database/ip_info_database.dart';
import 'package:test_task_energise_pro/data/ip_info_database/ip_info_database_impl.dart';
import 'package:test_task_energise_pro/data/repo/get_info_by_ip/get_info_by_ip_repo.dart';
import 'package:test_task_energise_pro/data/repo/get_info_by_ip/get_info_by_ip_repo_impl.dart';
import 'package:test_task_energise_pro/data/repo/get_ip/get_ip_repo.dart';
import 'package:test_task_energise_pro/data/repo/get_ip/get_ip_repo_impl.dart';
import 'package:dio/dio.dart' as dio;
import 'package:test_task_energise_pro/data/use_cases/map_use_case.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  // final prefs = await SharedPreferences.getInstance();
  final dataBaseIpInfo = await InitIpInfo.init();
  locator.registerLazySingleton<IpInfoDatabase>(
      () => IpInfoDatabaseImpl(dataBaseIpInfo));
  locator.registerLazySingleton<GetIpRepo>(() => GetIpRepoImpl());
  locator.registerLazySingleton<GetInfoByIpRepo>(() => GetInfoByIpRepoImpl());
  locator.registerLazySingleton(() => MapUseCase());
  locator.registerLazySingleton(() => dio.Dio());
}
