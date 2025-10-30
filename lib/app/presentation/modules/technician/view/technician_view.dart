import 'package:field_visit_app/app/presentation/global/controllers/snackbar/snackbar_gc.dart';
import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/global/widgets/btns/icon_filter_btn_gw.dart';
import 'package:field_visit_app/app/presentation/global/widgets/custom/events_gw.dart';
import 'package:field_visit_app/app/presentation/global/widgets/custom/menu_drawer.dart';
import 'package:field_visit_app/app/presentation/modules/technician/controller/technician_controller.dart';
import 'package:field_visit_app/app/presentation/modules/technician/utils/go_qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

class TechnicianView extends ConsumerWidget {
  const TechnicianView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final controller = ref.watch(technicianProvider);
    final state = controller.state;
    final snackbarController = snackbarGP.read();
    snackbarController.setContext(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Visitas'),
        actions: [
          IconFilterBtnGW(
            onTap: controller.onChangeFilter,
            filter: state.filter,
          ),
          20.w,
        ],
      ),
      drawer: const MenuDrawer(),
      body: state.loading
          ? const CircularProgressIndicator.adaptive().center
          : state.events.isEmpty
          ? const Text('No hay visitas registradas.').center
          : EventsGW(events: state.events),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goQr(),
        child: const Icon(Icons.qr_code),
      ),
    );
  }
}
