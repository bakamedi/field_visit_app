import 'package:field_visit_app/app/core/defs/type_defs.dart';
import 'package:field_visit_app/app/core/utils/failure_view_data.dart';
import 'package:field_visit_app/app/domain/models/success.dart';
import 'package:field_visit_app/app/domain/models/user/stored_user_model.dart';

abstract class UserRepository {
  Future<StoredUserModel> getUser();
  FutureEither<FailureViewData, Result> saveUser(StoredUserModel user);
  FutureEither<FailureViewData, Result> updatePermission({
    required Map<String, bool> resultsPermission,
  });
}
