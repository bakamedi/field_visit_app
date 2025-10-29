import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/modules/technician/controller/technician_controller.dart';
import 'package:field_visit_app/app/presentation/modules/technician/utils/go_qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

class TechnicianView extends ConsumerWidget {
  const TechnicianView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final controller = ref.watch(technicianProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Historial de Visitas')),
      body: Text('Tecnico View').center,
      floatingActionButton: FloatingActionButton(
        onPressed: () => goQr(),
        child: Icon(Icons.qr_code),
      ),
    );
  }
}
