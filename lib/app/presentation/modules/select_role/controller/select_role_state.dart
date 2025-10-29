import 'package:field_visit_app/app/presentation/modules/select_role/utils/select_role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_role_state.freezed.dart';

@freezed
abstract class SelectRoleState with _$SelectRoleState {
  const SelectRoleState._();

  const factory SelectRoleState({@Default([]) List<SelectRoleModel> roles}) =
      _SelectRoleState;

  static SelectRoleState get initialState => const SelectRoleState(roles: []);
}
