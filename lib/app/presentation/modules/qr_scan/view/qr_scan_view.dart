import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/modules/qr_scan/controller/qr_scan_controller.dart';
import 'package:field_visit_app/app/presentation/modules/qr_scan/utils/on_qr_change.dart';
import 'package:field_visit_app/app/presentation/modules/qr_scan/view/widgets/scanner_overlay_shape_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanView extends ConsumerWidget {
  const QrScanView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final controller = ref.watch(qrScanProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller.state.mobileScannerController,
            onDetect: (capture) {
              final barcode = capture.barcodes.first.rawValue;
              onQrChanged(barcode);
            },
          ),

          Container(
            width: size.width * 0.7,
            height: size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.9),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ).center,

          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: ShapeDecoration(
                  shape: ScannerOverlayShapeW(
                    borderColor: Colors.white,
                    borderRadius: 16,
                    cutOutSize: size.width * 0.7,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                const SizedBox(height: 8),
                Text(
                  'Coloca el código QR dentro del recuadro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => RouterUtil.pop(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
