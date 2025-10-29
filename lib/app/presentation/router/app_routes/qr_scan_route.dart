import 'package:field_visit_app/app/presentation/modules/qr_scan/view/qr_scan_view.dart';
import 'package:go_router/go_router.dart';

class QrScanRoute {
  static const path = '/qr-scan';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, _) {
        return QrScanView();
      },
    );
  }
}
