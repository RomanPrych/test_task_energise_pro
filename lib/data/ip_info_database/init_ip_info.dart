import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';

class InitIpInfo {
  static Future<({Database dataBase, StoreRef storeRef})> init() async {
    Database dataBaseIpInfo;
    StoreRef storeIpInfo;
    if (kIsWeb) {
      var databaseFactory = getDatabaseFactory(packageName: tableName);
      dataBaseIpInfo =
          await databaseFactory.openDatabase("$tableName.db");
    } else {
      final appDir = await getApplicationDocumentsDirectory();
      await appDir.create(recursive: true);
      final databasePath = join(appDir.path, "$tableName.db");
      dataBaseIpInfo =
          await databaseFactoryIo.openDatabase(databasePath);
    }
    storeIpInfo = intMapStoreFactory.store(tableName);
    return (dataBase: dataBaseIpInfo, storeRef: storeIpInfo);
  }

  static const String tableName = 'IpInfo';
}
