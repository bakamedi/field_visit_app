import 'package:field_visit_app/app/core/injects_providers/db/db_inject_provider.dart';
import 'package:field_visit_app/app/core/injects_providers/loggers/logger_inject_provider.dart';
import 'package:field_visit_app/app/data/source/providers/store/store_provider.dart';
import 'package:flutter_meedu/providers.dart';

class StoreInjectProvider {
  StoreInjectProvider._();

  static final storeInjectProvider = Provider(
    (ref) => StoreProvider(
      dbProvider: DbInjectProvider.dbInjectProvider.read(),
      storeName: 'my_store',
      logger: LoggerInjectProvider.loggerInjectProvider.read(),
    ),
  );
}
