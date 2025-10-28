import 'package:field_visit_app/app/core/injects_providers/loggers/logger_inject_provider.dart';
import 'package:field_visit_app/app/data/source/providers/db/db_provider.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:sembast/sembast_io.dart';

class DbInjectProvider {
  DbInjectProvider._();

  static final dbInjectProvider = Provider(
    (ref) => DbProvider(
      databaseFactory: databaseFactoryIo,
      logger: LoggerInjectProvider.loggerInjectProvider.read(),
    ),
  );
}
