import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/global/widgets/custom/events_gw.dart';
import 'package:field_visit_app/app/presentation/global/widgets/custom/menu_drawer.dart';
import 'package:field_visit_app/app/presentation/modules/supervisor/controller/supervisor_controllador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

class SupervisorView extends ConsumerWidget {
  const SupervisorView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final controller = ref.watch(supervisorProvider);
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(title: const Text('Supervisor')),
      drawer: const MenuDrawer(),
      body: state.loading
          ? const CircularProgressIndicator.adaptive().center
          : state.events.isEmpty
          ? const Text('No hay visitas registradas.').center
          : EventsGW(events: state.events, showName: true),
    );
  }
}
