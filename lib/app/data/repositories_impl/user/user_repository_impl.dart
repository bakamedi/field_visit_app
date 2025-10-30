import 'package:field_visit_app/app/core/defs/type_defs.dart';
import 'package:field_visit_app/app/core/helpers/either/either.dart';
import 'package:field_visit_app/app/core/helpers/either/handle_failure.dart';
import 'package:field_visit_app/app/core/helpers/failure.dart';
import 'package:field_visit_app/app/core/utils/failure_view_data.dart';
import 'package:field_visit_app/app/data/source/providers/storage/storage_provider.dart';
import 'package:field_visit_app/app/domain/models/permission/permission_model.dart';
import 'package:field_visit_app/app/domain/models/success.dart';
import 'package:field_visit_app/app/domain/models/user/stored_user_model.dart';
import 'package:field_visit_app/app/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required StorageProvider storageProvider,
    required String storageName,
  }) : _storageProvider = storageProvider,
       _storageName = storageName;
  final StorageProvider _storageProvider;
  final String _storageName;

  @override
  Future<StoredUserModel> getUser() async {
    final userString = await _storageProvider.readValue(_storageName);
    if (userString.isEmpty) {
      return StoredUserModel.initialState;
    }
    try {
      return userFromJson(userString);
    } catch (e) {
      await _storageProvider.writeValue(_storageName, '');
      return StoredUserModel.initialState;
    }
  }

  @override
  FutureEither<FailureViewData, Result> saveUser(StoredUserModel? user) async {
    try {
      if (user == null) {
        return Left(mapFailureToView(const StorageFailure('Usuario nulo')));
      }
      await _storageProvider.writeValue(_storageName, userToJson(user));
      return const Right(Success());
    } catch (e) {
      return Left(
        mapFailureToView(const StorageFailure('No se pudo guardar el usuario')),
      );
    }
  }

  @override
  FutureEither<FailureViewData, Result> updatePermission({
    required Map<String, bool> resultsPermission,
  }) async {
    final userString = await _storageProvider.readValue(_storageName);
    if (userString.isEmpty) {
      return Left(
        mapFailureToView(const StorageFailure('No hay usuario almacenado')),
      );
    }
    final user = userFromJson(userString);
    final updatedUser = user.copyWith(
      permission: PermissionModel(
        camera: resultsPermission['camera'] ?? false,
        location: resultsPermission['location'] ?? false,
      ),
    );
    try {
      await _storageProvider.writeValue(_storageName, userToJson(updatedUser));
      return const Right(Success());
    } catch (e) {
      return Left(
        mapFailureToView(
          const StorageFailure(
            'No se pudo actualizar los permisos del usuario',
          ),
        ),
      );
    }
  }

  @override
  FutureEither<FailureViewData, Result> updateUser(StoredUserModel user) async {
    try {
      await _storageProvider.writeValue(_storageName, userToJson(user));
      return const Right(Success());
    } catch (e) {
      return Left(
        mapFailureToView(
          const StorageFailure('No se pudo actualizar el usuario'),
        ),
      );
    }
  }
}
