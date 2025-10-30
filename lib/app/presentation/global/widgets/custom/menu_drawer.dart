import 'package:field_visit_app/app/presentation/global/controllers/session/session_gc.dart';
import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/router/app_routes/select_role_route.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onPrimary;

    final controller = sessionGP.read();
    final isDarkMode = controller.state.userPreferences.isDarkMode;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menú',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListView(
            padding: EdgeInsets.zero,
            children: [
              SwitchListTile.adaptive(
                secondary: const Icon(Icons.dark_mode_outlined),
                title: const Text('Modo oscuro'),
                value: isDarkMode,
                onChanged: (value) {
                  final controller = sessionGP.read();
                  controller.toggleDarkMode(value);
                },
              ),
            ],
          ).expanded,

          SafeArea(
            top: false,
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () => RouterUtil.go(SelectRoleRoute.path),
            ),
          ),
        ],
      ),
    );
  }
}
