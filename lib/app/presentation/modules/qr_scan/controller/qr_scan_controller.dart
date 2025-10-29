import 'package:field_visit_app/app/core/defs/type_defs.dart';
import 'package:field_visit_app/app/core/helpers/failure.dart';
import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/repositories/geolocation/geolocation_repository.dart';
import 'package:field_visit_app/app/presentation/modules/qr_scan/controller/qr_scan_state.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final qrScanProvider = Provider.state<QrScanController, QrScanState>(
  (_) => QrScanController(
    QrScanState.initialState,
    geolocationRepository: Repositories.geolocationRep.read(),
  ),
);

class QrScanController extends StateNotifier<QrScanState> {
  QrScanController(
    super.initialState, {
    required GeolocationRepository geolocationRepository,
  }) : _geolocationRepository = geolocationRepository {
    _onInit();
  }

  final GeolocationRepository _geolocationRepository;

  void _onInit() {
    state = state.copyWith(
      mobileScannerController: MobileScannerController(
        detectionTimeoutMs: 1000,
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
    );
  }

  FutureEither<Failure, LatLng?> getLocation() async {
    return await _geolocationRepository.getCurrentLocation();
  }

  void scanData(String? data) {
    state.mobileScannerController!.pause();
  }

  @override
  void dispose() {
    state.mobileScannerController!.dispose();
    super.dispose();
  }
}
