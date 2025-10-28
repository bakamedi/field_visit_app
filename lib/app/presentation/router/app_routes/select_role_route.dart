import 'package:field_visit_app/app/presentation/modules/select_role/view/select_role_view.dart';
import 'package:go_router/go_router.dart';

class SelectRoleRoute {
  static const path = '/select-role';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, _) {
        return const SelectRoleView();
      },
    );
  }
}
