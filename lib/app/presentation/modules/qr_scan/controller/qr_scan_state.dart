import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'qr_scan_state.freezed.dart';

@freezed
abstract class QrScanState with _$QrScanState {
  const QrScanState._();

  const factory QrScanState({
    MobileScannerController? mobileScannerController,
  }) = _QrScanState;

  static QrScanState get initialState => const QrScanState();
}
