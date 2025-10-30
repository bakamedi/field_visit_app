import 'package:field_visit_app/app/presentation/global/utils/random_util.dart';
import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/global/utils/snackbar_util.dart';
import 'package:field_visit_app/app/presentation/modules/qr_scan/controller/qr_scan_controller.dart';
import 'package:field_visit_app/app/presentation/modules/technician/controller/technician_controller.dart';

void onQrChanged(String? data) async {
  if (data == null) {
    return;
  }
  final controller = qrScanProvider.read();
  final result = await controller.getLocation();

  result.fold((failure) => SnackbarUtil.showError(failure.message), (
    position,
  ) async {
    controller.scanData(RandomUtil.getRandomCode().toString());
    final result = await controller.createEvent(
      lat: position!.latitude,
      lng: position.longitude,
    );
    final controllerTechnician = technicianProvider.read();
    await controllerTechnician.loadEvents();
    RouterUtil.pop();

    result.fold(
      (failure) => SnackbarUtil.showError(failure.message),
      (success) => SnackbarUtil.showSuccess('Event created successfully'),
    );
  });
}
