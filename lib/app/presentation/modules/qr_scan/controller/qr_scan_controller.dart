import 'package:field_visit_app/app/presentation/modules/qr_scan/controller/qr_scan_state.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final qrScanProvider = Provider.state<QrScanController, QrScanState>(
  (_) => QrScanController(QrScanState.initialState),
);

class QrScanController extends StateNotifier<QrScanState> {
  QrScanController(super.initialState) {
    _onInit();
  }

  void _onInit() {
    state = state.copyWith(
      mobileScannerController: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
    );
  }
}
