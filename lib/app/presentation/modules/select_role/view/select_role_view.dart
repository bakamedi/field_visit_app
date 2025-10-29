import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/modules/select_role/view/widgets/role_card_w.dart';
import 'package:flutter/material.dart';

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona tu perfil'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onSecondary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            12.h,

            const Text(
              'Elige cómo deseas ingresar a la aplicación',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            28.h,

            GestureDetector(
              onTap: () {},
              child: RoleCardW(
                icon: Icons.build,
                title: 'Técnico',
                subtitle: 'Accede a tus visitas y herramientas de campo',
                buttonLabel: '',
                onTap: () {},
              ),
            ),
            16.h,
            GestureDetector(
              onTap: () {},
              child: RoleCardW(
                icon: Icons.supervisor_account,
                title: 'Supervisor',
                subtitle: 'Revisa reportes y asigna tareas',
                buttonLabel: '',
                onTap: () {},
              ),
            ),

            const Spacer(),
            Text(
              'Si necesitas cambiar de perfil más tarde, podrás hacerlo desde la configuración.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            8.h,
          ],
        ).padding(const EdgeInsets.all(20)),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: const EdgeInsets.all(16),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Ingresar',
              //'Selecciona un perfil' : 'Ingresar',
            ),
          ),
        ).padding(EdgeInsets.symmetric(horizontal: 10)),
      ),
    );
  }
}
