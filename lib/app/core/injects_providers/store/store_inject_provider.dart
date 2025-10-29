import 'package:flutter_meedu/providers.dart';

import '../../../data/source/providers/store/store_provider.dart';
import '../db/db_inject_provider.dart';
import '../loggers/logger_inject_provider.dart';

class StoreInjectProvider {
  StoreInjectProvider._();

  static Provider<StoreProvider> storeInjectProvider({
    required String storeName,
  }) {
    return Provider(
      (ref) => StoreProvider(
        dbProvider: DbInjectProvider.dbInjectProvider.read(),
        storeName: storeName,
        logger: LoggerInjectProvider.loggerInjectProvider.read(),
      ),
    );
  }
}
