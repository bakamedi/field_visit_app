import 'package:field_visit_app/app/core/defs/type_defs.dart';
import 'package:field_visit_app/app/core/helpers/either/either.dart';
import 'package:field_visit_app/app/core/helpers/failure.dart';
import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:field_visit_app/app/domain/models/success.dart';
import 'package:field_visit_app/app/domain/repositories/event/event_repository.dart';
import 'package:field_visit_app/app/domain/repositories/geolocation/geolocation_repository.dart';
import 'package:field_visit_app/app/domain/repositories/user/user_repository.dart';
import 'package:field_visit_app/app/presentation/modules/qr_scan/controller/qr_scan_state.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final qrScanProvider = Provider.state<QrScanController, QrScanState>(
  (_) => QrScanController(
    QrScanState.initialState,
    geolocationRepository: Repositories.geolocationRep.read(),
    eventRepository: Repositories.eventRep.read(),
    userRepository: Repositories.userRep.read(),
  ),
);

class QrScanController extends StateNotifier<QrScanState> {
  QrScanController(
    super.initialState, {
    required GeolocationRepository geolocationRepository,
    required EventRepository eventRepository,
    required UserRepository userRepository,
  }) : _geolocationRepository = geolocationRepository,
       _eventRepository = eventRepository,
       _userRepository = userRepository {
    _onInit();
  }

  final GeolocationRepository _geolocationRepository;
  final EventRepository _eventRepository;
  final UserRepository _userRepository;

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
    state = state.copyWith(scannedData: data);
  }

  FutureEither<Failure, Result> createEvent({
    required double lng,
    required double lat,
  }) async {
    try {
      final user = await _userRepository.getUser();
      final event = ItemModel(
        code: state.scannedData,
        lat: lat,
        lng: lng,
        userId: user.id,
        name: user.name,
        createdAt: DateTime.now().toIso8601String(),
      );
      await _eventRepository.addEvent(event);
      return Either.right(const Success());
    } catch (e) {
      return Either.left(
        DatabaseFailure('Error al crear el evento: ${e.toString()}'),
      );
    }
  }

  @override
  void dispose() {
    state.mobileScannerController!.dispose();
    super.dispose();
  }
}
