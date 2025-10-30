import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/global/utils/snackbar_util.dart';
import 'package:field_visit_app/app/presentation/modules/technician/controller/technician_controller.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/qr_scan_route.dart';

void goQr() async {
  final TechnicianController technicianController = technicianProvider.read();

  final result = await technicianController.checkCameraPermission();

  result.fold(
    (failure) => SnackbarUtil.showError(failure.message),
    (success) => RouterUtil.push(QrScanRoute.path),
  );
}
