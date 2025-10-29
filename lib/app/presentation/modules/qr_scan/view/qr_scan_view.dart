import 'package:field_visit_app/app/presentation/modules/qr_scan/controller/qr_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanView extends ConsumerWidget {
  const QrScanView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final controller = ref.watch(qrScanProvider);

    return Scaffold(
      body: MobileScanner(
        controller: controller.state.mobileScannerController,
        onDetect: (result) {
          print(result.barcodes.first.rawValue);
        },
      ),
    );
  }
}
