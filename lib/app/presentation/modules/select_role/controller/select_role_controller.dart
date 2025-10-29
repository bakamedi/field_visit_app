import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/repositories/index_repositories.dart';
import 'package:field_visit_app/app/presentation/modules/select_role/controller/select_role_state.dart';
import 'package:field_visit_app/app/presentation/modules/select_role/utils/select_role_model.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/supervisor_route.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/technician_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

final selectRoleProvider =
    Provider.state<SelectRoleController, SelectRoleState>(
      (_) => SelectRoleController(
        SelectRoleState.initialState,
        userRepository: Repositories.userRep.read(),
      ),
    );

class SelectRoleController extends StateNotifier<SelectRoleState> {
  SelectRoleController(
    super.initialState, {
    required UserRepository userRepository,
  }) : _userRepository = userRepository {
    _onInit();
  }

  final UserRepository _userRepository;

  void _onInit() {
    final roles = [
      SelectRoleModel(
        title: 'Técnico',
        subTitle: 'Accede a tus visitas y herramientas de campo',
        iconData: Icons.build,
        role: 'technician'.toUpperCase(),
        routeName: TechnicianRoute.path,
      ),
      SelectRoleModel(
        title: 'Supervisor',
        subTitle: 'Revisa reportes y asigna tareas',
        iconData: Icons.supervisor_account,
        role: 'supervisor'.toUpperCase(),
        routeName: SupervisorRoute.path,
      ),
    ];
    _updateRoles(roles);
  }

  void _updateRoles(List<SelectRoleModel> roles) {
    state = state.copyWith(roles: roles);
  }

  void selectRole(SelectRoleModel role) {
    final updatedRoles = state.roles.map((r) {
      if (r.title == role.title) {
        return SelectRoleModel(
          title: r.title,
          subTitle: r.subTitle,
          iconData: r.iconData,
          isSelected: true,
          role: r.role,
          routeName: r.routeName,
        );
      } else {
        return SelectRoleModel(
          title: r.title,
          subTitle: r.subTitle,
          iconData: r.iconData,
          isSelected: false,
          role: r.role,
          routeName: r.routeName,
        );
      }
    }).toList();

    state = state.copyWith(roles: updatedRoles, selectedRole: role);
  }

  void setSelectedRoleNull() async {
    final user = await _userRepository.getUser();
    final updUser = user.copyWith(
      role: state.selectedRole!.role,
      routeName: state.selectedRole!.routeName,
    );
    await _userRepository.saveUser(updUser);
  }

  bool get enabledContinueButton => state.roles.any((role) => role.isSelected);
}
