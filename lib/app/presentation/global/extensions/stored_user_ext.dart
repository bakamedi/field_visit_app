import 'package:field_visit_app/app/domain/models/user/stored_user_model.dart';

extension StoredUserExt on StoredUserModel {
  bool get isEmpty => id.isEmpty && role.isEmpty && routeName.isEmpty;
}
