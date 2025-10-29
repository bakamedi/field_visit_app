import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/modules/select_role/controller/select_role_controller.dart';
import 'package:field_visit_app/app/presentation/modules/select_role/utils/go_home.dart';
import 'package:field_visit_app/app/presentation/modules/select_role/view/widgets/role_card_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

class SelectRoleView extends ConsumerWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final theme = Theme.of(context);

    final selectRoleController = ref.watch(selectRoleProvider);
    final roles = selectRoleController.state.roles;

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

            Column(
              children: roles
                  .map(
                    (role) => Column(
                      children: [
                        RoleCardW(
                          icon: role.iconData,
                          title: role.title,
                          subtitle: role.subTitle,
                          isSelected: role.isSelected,
                          onTap: () => selectRoleController.selectRole(role),
                        ),
                        16.h,
                      ],
                    ),
                  )
                  .toList(),
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
            onPressed: selectRoleController.enabledContinueButton
                ? goHome
                : null,
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
