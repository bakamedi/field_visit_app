import 'package:field_visit_app/app/presentation/modules/supervisor/view/supervisor_view.dart';
import 'package:go_router/go_router.dart';

class SupervisorRoute {
  static const path = '/supervisor';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, _) {
        return const SupervisorView();
      },
    );
  }
}
