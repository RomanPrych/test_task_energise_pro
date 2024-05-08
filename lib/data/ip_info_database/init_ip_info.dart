import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';

class InitIpInfo {
  static Future<({Database dataBase, StoreRef storeRef})> init() async {
    Database _dataBaseIpInfo;
    StoreRef _storeIpInfo;
    if (kIsWeb) {
      var databaseFactory = getDatabaseFactory(packageName: tableName);
      _dataBaseIpInfo =
          await databaseFactory.openDatabase("$tableName.db");
    } else {
      final appDir = await getApplicationDocumentsDirectory();
      await appDir.create(recursive: true);
      final databasePath = join(appDir.path, "$tableName.db");
      _dataBaseIpInfo =
          await databaseFactoryIo.openDatabase(databasePath);
    }
    _storeIpInfo = intMapStoreFactory.store(tableName);
    return (dataBase: _dataBaseIpInfo, storeRef: _storeIpInfo);
  }

  static const String tableName = 'IpInfo';
}
