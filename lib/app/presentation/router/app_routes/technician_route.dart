import 'package:field_visit_app/app/presentation/modules/technician/view/technician_view.dart';
import 'package:go_router/go_router.dart';

class TechnicianRoute {
  static const path = '/technician';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, _) {
        return const TechnicianView();
      },
    );
  }
}
