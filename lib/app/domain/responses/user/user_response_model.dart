import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/defs/type_defs.dart';

part 'user_response_model.freezed.dart';
part 'user_response_model.g.dart';

@freezed
abstract class UserResponseModel with _$UserResponseModel {
  const UserResponseModel._();

  const factory UserResponseModel({
    @Default('') String id,
    @Default('') String email,
    @Default('') String accessToken,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Json json) =>
      _$UserResponseModelFromJson(json);
}
