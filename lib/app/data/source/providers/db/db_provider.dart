import 'package:field_visit_app/app/core/utils/directory_util.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';

class DbProvider {
  DbProvider({required DatabaseFactory databaseFactory, required Logger logger})
    : _databaseFactory = databaseFactory,
      _logger = logger;
  final DatabaseFactory _databaseFactory;
  final Logger _logger;

  late Database _db;

  Database get db => _db;

  Future<void> connect() async {
    try {
      final platformDir = await DirectoryUtil.appDocumentsDir;
      final dbPath = join(platformDir.path, 'my_database.db');
      _db = await _databaseFactory.openDatabase(dbPath);
      _logger.i('Database connected successfully');
    } catch (e) {
      _logger.e('Error connecting to database: $e');
      rethrow;
    }
  }

  Future<void> close() async {
    try {
      await _db.close();
      _logger.i('Database closed successfully');
    } catch (e) {
      _logger.e('Error closing database: $e');
      rethrow;
    }
  }
}
