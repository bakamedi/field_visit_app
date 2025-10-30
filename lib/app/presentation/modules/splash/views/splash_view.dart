import 'package:field_visit_app/app/presentation/global/controllers/session/session_gc.dart';
import 'package:field_visit_app/app/presentation/global/extensions/widgets_ext.dart';
import 'package:field_visit_app/app/presentation/global/utils/router_util.dart';
import 'package:field_visit_app/app/presentation/global/widgets/custom/card_icon_gw.dart';
import 'package:field_visit_app/app/presentation/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = Theme.of(context).colorScheme.primary;
    ref.listen(
      sessionGP,
      callback: (notifier) async {
        if (notifier.state.userPreferences.isDarkMode) {
          notifier.toggleDarkMode(true);
        }
      },
    );
    ref.listen(
      splashProvider,
      callback: (notifier) async {
        final state = notifier.state;
        if (state.routeName.isNotEmpty && context.mounted) {
          RouterUtil.pushReplacement(state.routeName);
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              24.h,

              SizedBox(
                width: 120,
                height: 120,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    CardIconGW(
                      iconData: Icons.engineering_rounded,
                      bgColor: primaryColor,
                      iconColor: Colors.white,
                    ),
                    CardIconGW(
                      iconData: Icons.supervisor_account_rounded,
                      bgColor: primaryColor.withValues(alpha: 0.1),
                      iconColor: primaryColor,
                    ),
                    CardIconGW(
                      iconData: Icons.map_rounded,
                      bgColor: primaryColor.withValues(alpha: 0.1),
                      iconColor: primaryColor,
                    ),
                    CardIconGW(
                      iconData: Icons.qr_code_2_rounded,
                      bgColor: primaryColor,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ),

              24.h,

              Text(
                'Field Visit',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  letterSpacing: 1.2,
                ),
              ),

              8.h,

              Text(
                'Cargando...',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),

              24.h,

              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
