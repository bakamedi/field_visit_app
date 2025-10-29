import 'package:field_visit_app/app/core/injects_providers/db/db_inject_provider.dart';
import 'package:field_visit_app/app/core/injects_providers/storage/storage_inject_provider.dart';
import 'package:field_visit_app/app/data/repositories_impl/index_repositories_impl.dart';
import 'package:field_visit_app/app/domain/repositories/index_repositories.dart';
import 'package:flutter_meedu/providers.dart';

class Repositories {
  Repositories._();

  static final routerRep = Provider<RouterRepository>(
    (ref) => RouterRepositoryImpl(),
  );

  static final snackbarRep = Provider<SnackbarRepository>(
    (ref) => SnackbarRepositoryImpl(),
  );

  static final dbRep = Provider<DbRepository>(
    (ref) =>
        DbRepositoryImpl(dbProvider: DbInjectProvider.dbInjectProvider.read()),
  );

  static final userPreferenceRep = Provider<UserPreferencesRepository>(
    (ref) => UserPreferencesRepositoryImpl(
      storageProvider: StorageInjectProvider.storageInjectProvider.read(),
    ),
  );

  static final permissionRep = Provider<PermissionRepository>(
    (ref) => const PermissionRepositoryImpl(),
  );

  static final userRep = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(
      storageProvider: StorageInjectProvider.storageInjectProvider.read(),
      storageName: 'stored_user',
    ),
  );

  static final geolocationRep = Provider<GeolocationRepository>(
    (ref) => GeolocationRepositoryImpl(),
  );
}
