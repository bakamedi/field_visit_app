import 'package:field_visit_app/app/core/helpers/either/either.dart';
import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/global/utils/snackbar_util.dart';
import 'package:field_visit_app/app/presentation/modules/qr_scan/controller/qr_scan_controller.dart';

void onQrChanged(String? data) async {
  if (data == null) {
    return;
  }
  final controller = qrScanProvider.read();
  final result = await controller.getLocation();
  result.when(
    left: (failure) {
      SnackbarUtil.showError(failure.message);
    },
    right: (position) async {
      controller.scanData(data);
      final result = await controller.createEvent(
        lat: position!.latitude,
        lng: position.longitude,
      );
      RouterUtil.pop();

      result.when(
        left: (failure) {
          SnackbarUtil.showError(failure.message);
        },
        right: (success) {
          SnackbarUtil.showSuccess('Event created successfully');
        },
      );
    },
  );
}
