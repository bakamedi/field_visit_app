import 'package:field_visit_app/app/domain/models/permission/permission_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'stored_user_model.freezed.dart';
part 'stored_user_model.g.dart';

StoredUserModel userFromJson(String str) =>
    StoredUserModel.fromJson(json.decode(str));

String userToJson(StoredUserModel data) => json.encode(data.toJson());

@freezed
abstract class StoredUserModel with _$StoredUserModel {
  const StoredUserModel._();

  const factory StoredUserModel({
    @Default('') String id,
    @Default('') String routeName,
    @Default('') String role,
    @Default('') String name,
    required PermissionModel permission,
  }) = _UserModel;

  factory StoredUserModel.fromJson(Map<String, dynamic> json) =>
      _$StoredUserModelFromJson(json);

  static StoredUserModel get initialState => StoredUserModel(
    id: '',
    role: '',
    name: '',
    permission: PermissionModel.empty(),
    routeName: '',
  );

  static StoredUserModel empty() => StoredUserModel(
    id: '',
    role: '',
    name: '',
    permission: PermissionModel.empty(),
    routeName: '',
  );
}
