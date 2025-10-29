import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/modules/select_role/controller/select_role_controller.dart';

void goHome() {
  final SelectRoleController controller = selectRoleProvider.read();
  if (controller.state.selectedRole == null) {
    return;
  }
  final String homeRoute = controller.state.selectedRole!.routeName;
  RouterUtil.pushReplacement(homeRoute);
}
