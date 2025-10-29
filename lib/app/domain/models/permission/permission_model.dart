import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

@freezed
abstract class PermissionModel with _$PermissionModel {
  const factory PermissionModel({
    required bool location,
    required bool camera,
  }) = _PermissionModel;

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  static PermissionModel empty() =>
      const PermissionModel(location: false, camera: false);
}
