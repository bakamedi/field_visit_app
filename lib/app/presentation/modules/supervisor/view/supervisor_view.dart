import 'package:field_visit_app/app/presentation/global/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class SupervisorView extends StatelessWidget {
  const SupervisorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Supervisor')),
      drawer: const MenuDrawer(),
      body: const Center(child: Text('Supervisor View')),
    );
  }
}