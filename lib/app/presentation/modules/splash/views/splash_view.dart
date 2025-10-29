import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';

import '../controllers/splash_controller.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    ref.listen(
      splashProvider,
      callback: (notifier) async {
        final controller = notifier.state;
        if (controller.routeName.isNotEmpty && context.mounted) {
          context.pushReplacementNamed(controller.routeName);
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FlutterLogo(size: 84),
              16.h,
              Text(
                'Field Visit',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                semanticsLabel: 'Nombre de la aplicación',
              ),
              8.h,
              Text(
                'Cargando…',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                semanticsLabel: 'Indicador de carga',
              ),
              20.h,
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
